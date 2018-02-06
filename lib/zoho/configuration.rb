module Zoho
  class Configuration
    attr_accessor :organization_id, :auth_token, :per_page

    def initialize
      @per_page = 50
    end
  end
end
