class ItemsController < ApplicationController
  include ItemsHelper
  
  def index
    if params[:q] 
      parse_search_dates!(params)
      @items = Item.search(params[:q])
    else
      @items = Item.limit(20)
    end
  end

  def new
    @item = Item.new
  end

  def create
    @item = current_user.lended_items.new(params[:item])
    parse_create_dates!(params)
    @item.create_dates(parse_create_dates!(params))
    if params[:photo]
      params[:photo].each do |k,v|
        @item.photos << Photo.create(file: v)
      end
    end

    if @item.save
      flash[:notice] = "Item was successfully created"
      redirect_to items_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
    @feedback = Feedback.new
    @feedbacks = @item.received_feedbacks.any? ? @item.received_feedbacks.order("created_at DESC") : nil
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])

    if @item.update_attributes(params[:item])
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy

    redirect_to items_path
  end
end
