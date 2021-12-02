class MandalartsController < ApplicationController
  def index
    @mandalarts = Mandalart.all
  end

  def new
    @mandalart = Mandalart.new
  end

  def create
    @mandalart = Mandalart.new(mandalart_params)
    if @mandalart.save
      redirect_to mandalarts_path
    else
      render 'new'
    end

  end

  private
    def mandalart_params
      params.require(:mandalart).permit(:text)
    end
end
