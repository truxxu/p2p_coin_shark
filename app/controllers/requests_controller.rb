class RequestsController < ApplicationController
  def index
    @requests = Request.where(loan_id: params[:loan_id])
  end

  def show
    @request = Request.find(params[:id])
    @user = User.find(@request.user)
  end
end
