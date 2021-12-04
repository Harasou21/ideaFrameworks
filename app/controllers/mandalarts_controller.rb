class MandalartsController < ApplicationController
  def index


    # 最初から配列の要素を9つ入れとく
    # 配列の要素の中身があれば、何もしない
    # 配列の要素の中身があれば、""の要素を入れとく


    @mandalarts = Mandalart.all

    if @mandalarts.count < $mandalart_blocks_num
      ($mandalart_blocks_num - @mandalarts.count).times do |mandalart|
        Mandalart.create(text: '')
      end
      @mandalarts = Mandalart.all
    end

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
