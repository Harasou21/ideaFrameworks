class MandalartsController < ApplicationController
  def index
    @mandalarts = Mandalart.all
    new
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

  def edit
    @mandalart = Mandalart.find(params[:id])
  end

  def update
    @mandalart = Mandalart.find(params[:id])
    if @mandalart.update(mandalart_params)
      redirect_to mandalarts_path
    else
      render 'edit'
    end
  end

  private
    def mandalart_params
      params.require(:mandalart).permit(:text)
    end
end
