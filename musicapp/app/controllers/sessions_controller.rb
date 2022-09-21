class SessionsController < ApplicationController
    before_action :require_logged_in, only: [:destroy]
    def new
        # @user = User.new
        render :new 
    end

    def create
        user = User.find_by_credentials(params[:user][:email], params[:user][:password])
        if user
            login!(user)
            redirect_to bands_url
        else
            flash.now[:errors] = ['invalid username or password']
            render :new
        end
    end

    def destroy
        logout!
        # render :new
        redirect_to new_session_url
    end
end
