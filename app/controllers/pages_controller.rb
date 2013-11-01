class PagesController < ApplicationController

  def index
    @search = Item.search(params[:q])
  end

end
