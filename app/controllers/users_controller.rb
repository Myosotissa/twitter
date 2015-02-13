class UsersController < ApplicationController
  before_action :signed_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy
  def new
    @user = User.new
  end
  
  def index
    @users = User.paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
  end
  
  def create
    @user = User.new(user_params)
    
    if @user.save == true

      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
   
    if @user.update(user_params) == true
       flash[:success] = "Редактирование прошло успешно!"
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted."
    redirect_to users_url
  end
  
  private
  def signed_in_user
    if not signed_in? 
      redirect_to signin_url notice: "Пожалуйста войдите в систему"
  end
  end
  def correct_user
    if current_user.id != params[:id].to_i
      redirect_to root_url, notice: "Отказано в доступе"
    end
  end
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
  end
  
