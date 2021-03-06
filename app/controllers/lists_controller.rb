class ListsController < ApplicationController

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    @bookmarks = @list.bookmarks
  end

  def new
    @list = List.new # needed to instantiate the form_for
  end

  def create
    @list = List.new(list_params)
    if @list.save
    # Will raise ActiveModel::ForbiddenAttributesError
      redirect_to list_path(@list)
  else
    render :new
  end
end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end
