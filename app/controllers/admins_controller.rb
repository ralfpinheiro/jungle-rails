class AdminsController < ApplicationController

    # http_basic_authenticate_with :name => ENV['ADMIN_USERNAME'], :password => ENV['ADMIN_PASSWORD']

    before_filter :authenticate
    
    def authenticate
        authenticate_or_request_with_http_basic('Administration') do |name, password|
        name == ENV['ADMIN_USERNAME'] && password == ENV['ADMIN_PASSWORD']
    end
    end
end

