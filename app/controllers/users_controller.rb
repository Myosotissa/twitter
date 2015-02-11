class UsersController < ApplicationController
<<<<<<< HEAD
=======

>>>>>>> sign-in-out
  def new
    @user = User.new
  end
  
<<<<<<< HEAD
  def show 
    @user = User.find(params[:id])
  end
  def create
    @user = User.new(user_params)
    if @user.save == true 
=======
  def show
    @user = User.find(params[:id])
  end
  
  def create
    @user = User.new(user_params)
    
    if @user.save == true
>>>>>>> sign-in-out
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
<<<<<<< HEAD
end
  end
  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
end
=======
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password,
                                                  :password_confirmation)
  end
end
>>>>>>> sign-in-out
