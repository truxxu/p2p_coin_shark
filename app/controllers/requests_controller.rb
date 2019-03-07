class RequestsController < ApplicationController
  def index
    @requests = Request.where(loan_id: params[:loan_id])
  end

  def my_requests
    @requests = Request.where(user_id: current_user.id)
  end

  def show
    @request = Request.find(params[:id])
    @user = @request.loan.user
  end
end
