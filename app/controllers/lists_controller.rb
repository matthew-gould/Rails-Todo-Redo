class ListsController < ApplicationController

  def new
    @list = List.new
  end

  def create
    list_params = params[:list]
    @list = List.new title: list_params[:title].downcase.capitalize, user_id: current_user.id
    if @list.save
      flash[:notice] = "Post created!"
      redirect_to new_list_path(@list)
    else
      render :new
    end
  end

  def index
    @lists = List.all
  end

  def show
    @list = List.find params[:id]
  end

end