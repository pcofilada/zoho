module Zoho
  class Configuration
    attr_accessor :organization_id, :auth_token, :per_page

    def initialize
      @per_page = 200
    end
  end
end
