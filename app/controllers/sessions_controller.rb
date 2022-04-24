class SessionsController < ApplicationController

  def new
  end

  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    password = params[:session][:password]
    if user && user.authenticate(password)
      log_in user
      redirect_to user
    else
      flash[:danger] = 'パスワードとemailの組み合わせが正しくありません'
      render 'new'
    end
  end
end
