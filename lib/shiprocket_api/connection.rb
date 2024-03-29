module ShiprocketAPI
  class Connection < ActiveResource::Connection
    # override #get to handle get with body
    def get(path, headers = {}, body: nil)
      arguments = if body.nil?
                    [path, build_request_headers(headers, :get, site.merge(path))]
                  else
                    [path, body, build_request_headers(headers, :get, site.merge(path))]
                  end
      with_auth { request(:get, *arguments) }
    end

    def request(method, path, *arguments)
      result = ActiveSupport::Notifications.instrument('request.active_resource') do |payload|
        payload[:method]      = method
        payload[:request_uri] = "#{site.scheme}://#{site.host}:#{site.port}#{path}"
        payload[:result]      = if method == :get && arguments.length == 2
                                  HTTP.headers(arguments[1].symbolize_keys)
                                      .get(payload[:request_uri], json: arguments[0])
                                else
                                  http.send(method, path, *arguments)
                                end
        payload[:result]
      end
      handle_response(result)
    rescue Timeout::Error => e
      raise ActiveResource::TimeoutError, e.message
    rescue OpenSSL::SSL::SSLError => e
      raise ActiveResource::SSLError, e.message
    end

    # Handles response and error codes from the remote service.
    def handle_response(response)
      body = JSON.parse(response.body)
      if response.code.to_i == 200 && (body['message'] || body.dig('payload', 'error_message'))
        raise CreationError, response
      else
        super
      end
    rescue JSON::ParserError
      super
    end
  end
end
