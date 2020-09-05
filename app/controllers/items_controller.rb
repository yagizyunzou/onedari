class ItemsController < ApplicationController
  before_action :require_user_logged_in, only: [:destroy, :edit]
  before_action :currect_user, only: [:destroy]
  
  def index
    @items = Item.order(id: :desc)
  end
  
  def show
    @item = Item.find(params[:id])
  end
  
  def new
    @item = Item.new
  end
 
  def create
    @user = current_user
    @item = current_user.items.build(item_params)
    if @item.save
      flash[:success] = "アイテムを登録しました。"
      redirect_to root_url
    else
      @items = current_user.items.order(id: :desc).page(params[:page])
      flash.now[:danger] = "アイテムの登録に失敗しました。"
      render :new
    end
  end
  
  def destroy
    @item.destroy
    flash[:sucesss] = "アイテムを削除しました。"
    render :new
  end
  
  def edit
    @item = Item.find(params[:id])
  end
 
  def update
    @item = Item.find(params[:id])
   
    if @item.update(item_params)
      flash[:sucesss] = "アイテム情報を更新しました。"
      redirect_to @item
    else
      flash.now[:danger] = "アイテム情報を更新できませんでした。"
      render :edit
    end
  end
  
  def attention
    @item = Item.find(params[:id])
  end
  

  private
  
  def item_params
    params.require(:item).permit(:name, :url, :comment, :price, :image)
  end
  
  def currect_user
    @item = current_user.items.find_by(id: params[:id])
    unless @item
      redirect_to root_url
    end
  end

end