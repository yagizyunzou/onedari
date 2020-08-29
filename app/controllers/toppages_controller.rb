class ToppagesController < ApplicationController
  def index
    @users = User.order(id: :desc)
    @items = Item.order(id: :desc)
  end
end
