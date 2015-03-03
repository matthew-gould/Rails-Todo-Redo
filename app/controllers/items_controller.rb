class ItemsController < ApplicationController
  before_action :authenticate_user!

  def new
    @list = List.find params[:list_id]
    @item = Item.new
  end

  def create
    @list = List.find params[:list_id]
    item_params = params[:item]
    @item = current_user.items.new(name: item_params[:name], due_date: item_params[:due_date], list_id: params[:list_id])
    if @item.save
      flash[:notice] = "Item created!"
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  def index
    @items = Item.all
  end

end