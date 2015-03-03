class ListsController < ApplicationController
  before_action :authenticate_user!

  def new
    @list = List.new
  end

  def create
    list_params = params[:list]
    @list = current_user.lists.new title: list_params[:title].downcase.capitalize
    if @list.save
      flash[:notice] = "List created!"
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