class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new,:edit, :update,:destroy]
  before_action :find_item, only: [:show, :edit, :update,:destroy,]
  before_action :move_to_root_path, only: [:edit, :update,:destroy]
  before_action :sold_out, only: [:edit]

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
    
    
  end
  def edit
    
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  def update
    
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
    
    if current_user.id != @item.user_id
    redirect_to root_path 
    end
  end

  def find_item
    @item = Item.find(params[:id])
  end

  def sold_out
    redirect_to root_path if @item.management != nil
  end
end
