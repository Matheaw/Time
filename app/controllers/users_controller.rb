class UsersController < ApplicationController
  def index
    @users = User.all
    
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      #UserMailer.welcome_email(@user).deliver
      UserMailer.welcome_email(@user).deliver
      redirect_to user_path(id: @user.id), notice: "Successfully Signed Up"
    else

      render :new
      #redirent_to new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
     @user = User.find(params[:id])
     if @user.update_attributes(user_params)
       redirect_to user_path(id: @user.id), notice: "Successfully update"
     else
       flash[:notice]= "Update fail"
       render :edit
     end
     
  end

  def destroy
    @user = User.find(params[:id])
    
    if @user.destroy
    
      redirect_to users_path, notice: 'Successfully deleted User'
    else
      redirect_to request.referrer, "Cannot destroy user"
      render :index
    end
  end
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
    
  end
end
