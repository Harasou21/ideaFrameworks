class UsersController < ApplicationController

  before_action :find_user, only: [:show]

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if  @user.save
      
    else
      render  'new'
    end
  end

  def show
    
  end

  private

    def find_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name,:email,:password,
                                    :password_confirmation)
    end

end