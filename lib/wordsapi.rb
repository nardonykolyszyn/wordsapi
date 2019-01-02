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

  def part_of?(word)
    response = connection.get part_of_endpoint(word)
    response = process_response(response)
    OpenStruct.new(success?: true, body: response)
  rescue Faraday::ClientError => exception
    OpenStruct.new(success?: false, message: 'Wrong data provided', details: exception.response[:body].to_s)
  rescue Faraday::Error::TimeoutError, Faraday::ConnectionFailed, Timeout::Error => e
    OpenStruct.new(success?: false, message: 'Words API is not available')
  end

  def has_parts?(word)
    response = connection.get has_parts_endpoint(word)
    response = process_response(response)
    OpenStruct.new(success?: true, body: response)
  rescue Faraday::ClientError => exception
    OpenStruct.new(success?: false, message: 'Wrong data provided', details: exception.response[:body].to_s)
  rescue Faraday::Error::TimeoutError, Faraday::ConnectionFailed, Timeout::Error => e
    OpenStruct.new(success?: false, message: 'Words API is not available')
  end

  def similar_to(word)
    response = connection.get similar_to_endpoint(word)
    response = process_response(response)
    OpenStruct.new(success?: true, body: response)
  rescue Faraday::ClientError => exception
    OpenStruct.new(success?: false, message: 'Wrong data provided', details: exception.response[:body].to_s)
  rescue Faraday::Error::TimeoutError, Faraday::ConnectionFailed, Timeout::Error => e
    OpenStruct.new(success?: false, message: 'Words API is not available')
  end

  def usage_of(word)
    response = connection.get usage_of_endpoint(word)
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

  def type_of_endpoint(word)
    "/#{word}/typeOf"
  end

  def part_of_endpoint(word)
    "/#{word}/partOf"
  end

  def has_parts_endpoint(word)
    "/#{word}/hasParts"
  end

  def similar_to_endpoint(word)
    "/#{word}/similarTo"
  end

  def usage_of_endpoint(word)
    "/#{word}/usageOf"
  end
end