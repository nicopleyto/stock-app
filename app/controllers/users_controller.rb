class UsersController < ApplicationController
  before_action :verify_is_admin, only: [:index, :edit, :show, :create, :new]
  before_action :approved_trader, only: []

  def index
    @users = User.all
    @traders = @users.where(role: "trader", state: "Approved")
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.state = "Approved"
    @user.skip_confirmation!
    if @user.save
      redirect_to @user, notice: 'New trader was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path, notice: "You successfully deleted #{@user.email}'s profile."
  end
 
  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :state)
  end

  def verify_is_admin
    if current_user.admin?
       return
    else
       redirect_to root_path, notice: "You must be an admin to perform this action."
    end
  end

  def approved_trader
    if current_user.where(role: "trader", state: "Approved")
       return
    else
       redirect_to root_path, notice: "Please wait until your application has been approved before doing this action."
    end
  end
  
end