class BloggersController < ApplicationController

    def index 
        @bloggers = Blogger.all
    end 

    def show 
        @blogger = Blogger.find(params[:id])
    end 

    def new 
        @blogger = Blogger.new
    end 

    def create 
        @new_blogger = Blogger.create(blogger_params)
        if @new_blogger.valid?
            redirect_to blogger_path(@new_blogger)
        else
            flash[:error] = @new_blogger.errors.full_messages
            redirect_to new_blogger_path(@new_blogger)
        end
        
    end 

    private 

    def blogger_params
        params.require(:blogger).permit(:name, :bio, :age)
    end 
end
