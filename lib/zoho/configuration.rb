module Zoho
  class Configuration
    attr_accessor :organization_id
    attr_accessor :auth_token

    def initialize
      @organization_id
      @auth_token
    end
  end
end
