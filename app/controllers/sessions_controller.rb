class SessionsController < ApplicationController
    
    def new
        @user = User.new
    end
    
    def create
        @user = User.find_by(email: params[:session][:email])
        
        if @user
            if @user.authenticate(params[:session][:password])
                session[:user_id] = @user.id
                redirect_to root_path(id: @user.id), notice: 'Welcome Back!'
            else
               flash[:notice] = 'Invalid Email/Password' 
               render :new 
            end
        else
            flash[:notice] = 'User could not be found' 
               render :new
        end
    end
    
    def destroy
        session.delete(:user_id)
        redirect_to sign_in_path, notice: 'Successfully Signed Out'
        
    end
end
