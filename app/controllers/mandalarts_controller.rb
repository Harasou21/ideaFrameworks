class MandalartsController < ApplicationController
  def index
    @mandalarts = Mandalart.all
  end

  
end
