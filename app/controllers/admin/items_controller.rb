class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    #binding.pry
    if @item.save
      redirect_to admin_item_path(@item.id)
    else
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to admin_item_path(@item.id)
  end

  def destroy
    @item = Item.find(params[:id])
    @item.delete
    redirect_to admin_items_path
  end

  private
  def item_params
    params.require(:item).permit(:name, :size_height, :size_width, :introduction, :shipping_method, :price, item_images_images: [])
  end

end
