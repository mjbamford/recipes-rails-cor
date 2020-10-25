class AuthorsController < ApplicationController
    skip_before_action :verify_authenticity_token 
    def index
        @authors = Author.all
    end

    def show
        @author = Author.find params['id']
    end

    def new
        @author = Author.new
    end

    def create
        @author = Author.new permitted_params
        respond_to do |format|
            if @author.save
                format.html { redirect_to author_path(@author) }
            else
                format.html { render :new }
            end
        end
    end

    def permitted_params
        params.require(:author).permit(:first_name, :last_name)
    end
end
