class SessionsController < ApplicationController

    def welcome
    end

    def new
        @user = User.new
    end

    def create 

        if params[:provider] == 'google oauth2'
            @user = User.create_by_google_omniauth(auth)
            session[:user_id] = @user_id
            redirect_to user_path(@user)
        elsif
            @user = User.find_by(username: params[:user][:username])
            @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            flash[:notice] = "One or more fields incorrect, please try again"
            redirect_to login_path
        end
    end

    def destroy
        session.delete(:user_id)
        flash[:notice] = "Successfully Logged Out"
        redirect_to '/', notice: "Successfully Logged Out"
    end

    def omniauth
        if @user
            create_session
            redirect_to user_path(@user)
        else
            redirect_to login_path
        end
    end

    private

    def auth
        request.env['omniauth.auth']
    end
end


