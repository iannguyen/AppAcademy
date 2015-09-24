require 'json'
require 'webrick'

module Phase4
  class Session
    # find the cookie for this app
    # deserialize the cookie into a hash
    def initialize(request)
      found = request.cookies.find { |cookie| cookie.name == '_rails_lite_app' }
      @data = found ? JSON.parse(found.value) : {}
    end

    def [](key)
      @data[key]
    end

    def []=(key, val)
      @data[key] = val
    end

    # serialize the hash into json and save in a cookie
    # add to the responses cookies
    def store_session(response)
      response.cookies << WEBrick::Cookie.new('_rails_lite_app', @data.to_json)
    end
  end
end
