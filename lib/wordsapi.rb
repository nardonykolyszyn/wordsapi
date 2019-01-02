# frozen_string_literal: true

require 'wordsapi/base'

class WordsAPI < Base

  def service_url
    'https://wordsapiv1.p.rapidapi.com/words'
  end

  def has_types?(word)
    response = connection.get has_types_endpoint(word)
    response = process_response(response)
    OpenStruct.new(success?: true, body: response)
  rescue Faraday::ClientError => exception
    OpenStruct.new(success?: false, message: 'Wrong data provided', details: exception.response[:body].to_s)
  rescue Faraday::Error::TimeoutError, Faraday::ConnectionFailed, Timeout::Error => e
    OpenStruct.new(success?: false, message: 'Words API is not available')
  end

  def type_of?(word)
    response = connection.get type_of_endpoint(word)
    response = process_response(response)
    OpenStruct.new(success?: true, body: response)
  rescue Faraday::ClientError => exception
    OpenStruct.new(success?: false, message: 'Wrong data provided', details: exception.response[:body].to_s)
  rescue Faraday::Error::TimeoutError, Faraday::ConnectionFailed, Timeout::Error => e
    OpenStruct.new(success?: false, message: 'Words API is not available')
  end

  private

  def has_types_endpoint(word)
    "/#{word}/hasTypes"
  end

  def type_of_endpoint
    "/#{word}/typeOf"
  end
end