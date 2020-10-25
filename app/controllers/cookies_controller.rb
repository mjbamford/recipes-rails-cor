class CookiesController < ApplicationController
    def index
        cookies[:count] ||= 0
        # cookies[:count] = cookies[:count] || 0

        cookies[:count] = cookies[:count].to_i + 1
        # cookies[:count] += 1
    end
end
