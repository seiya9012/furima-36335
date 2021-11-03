class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  def index
    @items = Item.all.order(id: 'DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render :new
    end
  end
  def show
    @item = Item.find(params[:id])
    # @item = @item.user
  end

  private

  def item_params
    params.require(:item).permit(:name, :discription, :price, :category_id, :status_id, :cost_id,
                                 :prefecture_id, :shipping_day_id,:image).merge(user_id: current_user.id)
  end
end
