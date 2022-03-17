class PendingRequestsController < ApplicationController

    def index
        @request =  User.where(role: "trader", state: "Pending").where.not(confirmed_at: nil).order(:confirmed_at)
    end

    def show

    end

    def update
        @user = User.find(params[:id])
        @user.update(state: params[:state])
        redirect_to pending_requests_path, notice: "#{@user.email} has been #{@user.state}"
    end

end 