# frozen_string_literal: true

require 'faraday/request_id'
require 'faraday_middleware'
require_relative 'active_support/deep_symbolize_keys'

module WordsAPI
  class Base
    using SymbolizeHelper
    attr_reader :access_token

    def initialize(access_token: '')
      @access_token = access_token
    end

    def service_url
      'https://wordsapiv1.p.rapidapi.com/words/'
    end

    def has_types?(word)
      response = connection.get has_types_endpoint(word) do |req|
        puts req.inspect
      end
      response = process_response(response)
      OpenStruct.new(success?: true, body: response)
    rescue Faraday::ClientError => exception
      OpenStruct.new(success?: false, message: 'Los datos no son correctos', details: exception.response[:body].to_s)
    rescue Faraday::Error::TimeoutError, Faraday::ConnectionFailed, Timeout::Error => e
      OpenStruct.new(success?: false, message: 'El servidor de mercadopago se encuentra fuera de servicio. Intenta más tarde', details: 'Server timeout')
    end

    private

    def has_types_endpoint(word)
      "/#{word}/hasTypes"
    end

    def connection
      @connection ||= Faraday.new(service_url) do |config|
        config.request :json
        config.response :raise_error
        config.response :json, content_type: /\bjson$/
        config.use :instrumentation
        config.options[:timeout] = 10
        config.use Faraday::RequestId
        config.adapter Faraday.default_adapter
        config.headers['X-RapidAPI-Key'] = access_token
      end
    end

    def process_response(response)
      if response.success?
        body = response.body
        if body.empty?
          {}
        elsif body.is_a?(Array)
          body.map(&:deep_symbolize_keys)
        else
          body.deep_symbolize_keys
        end
      end
    end
  end
end
