class DeclinedRequestsController < ApplicationController

    def index
        @request =  User.where(role: "trader", state: "Declined").where.not(confirmed_at: nil).order(confirmed_at: :DESC)
    end

    def show
    
    end

    def destroy
        @user = User.find(params[:id])
        if @user.destroy
          redirect_to declined_requests_path, notice: "You successfully deleted #{@user.email}'s application."
        end
    end

end