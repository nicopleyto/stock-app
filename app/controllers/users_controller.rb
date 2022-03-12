class UsersController < ApplicationController
  before_action :verify_is_admin, only: [:index, :edit, :show, :create, :new]
  
  def index
    @users = User.all
    @traders = @users.where(role: "trader")
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

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

  def verify_is_admin
    if current_user.admin?
       return
    else
       redirect_to root_path, notice: "You must be an admin to perform this action."
    end
  end

end
