class UsersController < ApplicationController
  before_action :verify_is_admin, only: [:index, :edit, :show, :show_request, :create, :new]
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

    if @user.save
      redirect_to @user, notice: 'New trader was successfully created.'
    else
      render :new
    end
  end

  def update
    respond_to do |format|
      @user = User.find(params[:id])
      if  @user.update(user_params)
        format.html { redirect_to current_user, notice: "You successfully updated trader's profile."}
      else
        format.html { render :edit }
      end
    end
  end

  def update_state
    @user = User.find(params[:id])
    @user.update(state: params[:state])
    redirect_to :users, notice: "#{@user.email} changed status to #{@user.state}"
  end

  def show_request
    @users = User.all
    @request =  @users.where(role: "trader", state: "Pending")
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :state)
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
