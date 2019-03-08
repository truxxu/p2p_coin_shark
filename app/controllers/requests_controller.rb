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

  def new
    @loan = Loan.find(params[:loan_id])
    @request = Request.new
  end

  def create
    @loan = Loan.find(params[:loan_id])
    @request = Request.new(request_params)
    @request.user = current_user
    @request.loan = @loan
    if @request.save
      redirect_to my_requests_path(current_user.id)
    else
      render new_loan_request_path(params[:id])
    end
  end

  private

  def request_params
    params.require(:request).permit(:loan_start, :loan_end, :requested_amount)
  end
end
