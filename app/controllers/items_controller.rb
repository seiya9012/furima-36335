class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new,:edit, :update,]
  before_action :move_to_root_path, only: [:edit, :update,]
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
    
  end
  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end


  private

  def item_params
    params.require(:item).permit(:name, :discription, :price, :category_id, :status_id, :cost_id,
                                 :prefecture_id, :shipping_day_id,:image).merge(user_id: current_user.id)
  end

  def move_to_root_path
    @item = Item.find(params[:id])
    if current_user.id != @item.user_id
    redirect_to root_path 
    end
  end
end
