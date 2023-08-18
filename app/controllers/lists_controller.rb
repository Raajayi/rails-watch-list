class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    # @list = List.find(params[:id]).includes(:bookmark).order('bookmarks.priority ASC')
    @bookmarks = @list.prioritized_bookmarks
    # @list.bookmarks = @list.bookmarks.sort_by { |bookmark| bookmark[:priority] }
    # @list.bookmarks = @list.bookmarks.reverse
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.save
    if @list.save
      redirect_to list_path(@list), notice: 'List was successfully updated'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end
