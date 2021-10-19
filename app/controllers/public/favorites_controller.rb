class Public::FavoritesController < ApplicationController
  before_action :authenticate_customer!

  def index
    @favorites = current_customer.favorites.all
  end

  def create
    @favorite = Favorite.new(favorite_params)
    @favorite.customer_id = current_customer.id
    @favorite.save
    redirect_to favorites_path
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    @favorite.delete
    redirect_to favorites_path
  end

  def destroy_all
    @favorites = Favorite.all
    @favorites.delete_all
    redirect_to favorites_path
  end

  private
  def favorite_params
    params.require(:favorite).permit(:item_id)
  end
end
