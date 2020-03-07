class ApplicationController < ActionController::Base
  class ApplicationController < ActionController::Base
    before_action :basic_auth
  
    private
  
    def basic_auth
      authenticate_or_request_with_http_basic do |username, password|
        username == '6465teama' && password == 'tonsuke'
      end
    end
  end
end
