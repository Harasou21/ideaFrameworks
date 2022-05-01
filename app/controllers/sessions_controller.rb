class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    password = params[:session][:password]
    if user&.authenticate(password)
      log_in user
      redirect_to user
    else
      flash[:danger] = 'パスワードとemailの組み合わせが正しくありません'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
