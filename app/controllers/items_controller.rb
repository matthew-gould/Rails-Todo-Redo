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

   def show
    @item = Item.find params[:item_id]
  end

  def random
    @item = current_user.items.where("due_date is not null").order("RANDOM()").first
      if @item == nil
        @item = current_user.items.where(completed: false).order("RANDOM()").first
      end
  end

  def edit
    @item = Item.find params[:item_id]
  end  

  def update
    @item = Item.find params[:item_id]
    item_params =params[:item]
    if @item.update due_date: params[:item][:due_date]
      redirect_to all_items_path
    else
      render :edit
    end
  end

  def delete
    @item = Item.find params[:item_id]
    if @item.delete
      redirect_to all_items_path
    else
      render :show
    end
  end

end