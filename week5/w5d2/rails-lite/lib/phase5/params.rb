require 'uri'

module Phase5
  class Params
    # use your initialize to merge params from
    # 1. query string
    # 2. post body
    # 3. route params
    #
    # You haven't done routing yet; but assume route params will be
    # passed in as a hash to `Params.new` as below:
    def initialize(req, route_params = {})
      route_params.merge!(parse_www_encoded_form(req.query_string)) if req.query_string
      route_params.merge!(parse_www_encoded_form(req.body)) if req.body
      @params = route_params
    end

    def [](key)
      @params[key]
    end

    # this will be useful if we want to `puts params` in the server log
    def to_s
      @params.to_s
    end

    class AttributeNotFoundError < ArgumentError; end;

    private
    # this should return deeply nested hash
    # argument format
    # user[address][street]=main&user[address][zip]=89436
    # should return
    # { "user" => { "address" => { "street" => "main", "zip" => "89436" } } }
    def parse_www_encoded_form(www_encoded_form)
      decoded = URI::decode_www_form(www_encoded_form)
      hash = Hash.new
      decoded.each { |pair| hash[parse_key(pair.first)] = pair.last }
      arr = []
      hash.each { |key, value| arr << nested_keys(key, value) }
      left = arr.first
      right = arr.last
      deep_merge(left, right)
    end

    def nested_keys(keys, value = nil)
      return value if keys.empty?
      hash = Hash.new
      primary = keys.shift
      hash[primary] = nested_keys(keys, value)
      hash
    end

    def parse_key(key)
      key.split(/\]\[|\[|\]/)
    end

    def deep_merge(hash1, hash2)
      hash1.keys.each do |key|
        if hash1[key].is_a? Hash
          hash2[key] = deep_merge(hash1[key], hash2[key])
        else
          hash2[key] ||= hash1[key]
        end
      end
      return hash2
    end

    # this should return an array
    # user[address][street] should return ['user', 'address', 'street']
    def parse_key(key)
      key.split(/\]\[|\[|\]/)
    end
  end
end

# write method takes each key a parameter
# return nested hash { 'user' => { 'address' => { 'street' => nil }}}
# step 2 assign nil a value
