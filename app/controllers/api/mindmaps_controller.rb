class Api::MindmapsController < ApplicationController
  def index
    @mindmaps = Mindmap.all
  end
end
