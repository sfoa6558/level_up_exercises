# HTTP request manager
require 'cgi'
require 'net/http'
require 'uri'

class Request

  # Makes the request to the web service.
  #
  # @param [String] path     Web service name.
  # @param [Hash]   options  Request options.
  # @return [String, Boolean] XML on success, false if not.
  def self.get(options = {},api)
    response = make_request(api).get(uri(options,api))

    case response.code.to_i
      when 200
        response.body
      else
        raise "API request failed"
    end
  end

  # gets the request object.
  #
  # @return [Net::HTTP] HTTP object.
  def self.make_request(api)
    api_config     =    api
    http = Net::HTTP.new(api_config.host, api_config.port)


    http.open_timeout = api_config.http_open_timeout
    http.read_timeout = api_config.http_read_timeout
    http

  end

  # Generate the url for the request.
  #
  # @param [String] path     Web service name.
  # @param [Hash]   options  Request options.
  def self.uri(options = {},api)
    path = api.path
    "/#{path}#{hash_to_query_string(options)}"
  end

  # Turns request options into query string.
  #
  # @param [Hash] hash Request options.
  # @return [String] Formatted query string.
  def self.hash_to_query_string(hash)
   hash = hash.collect { |key, value|
      key.to_s
      "#{CGI.escape(key.to_s)}=#{CGI.escape(value.to_s)}"
    }

    hash.join("&")
  end

  # Turns request options into query string.
  #
  # @param [Hash] hash Request options.
  # @return [String] Formatted query string.
  def self.old_hash_to_query_string(hash)
    hash = hash.sort_by { |key, value|
      key.to_s
    }.reverse.collect { |key, value|
      "#{CGI.escape(key.to_s).gsub(/\_/, '-')}=#{CGI.escape(value.to_s)}"
    }

    hash.join("&")
  end
end
