class BookmarksController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    # @movie = List.find(params[:movie_id])
    @bookmark = Bookmark.new
  end

  def create
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @bookmark = Bookmark.find(params[:id])
    @list = List.find(@bookmark[:list_id])
  end

  def update
    Bookmark.update(bookmark_params)
    @bookmark = Bookmark.find(params[:id])
    redirect_to list_path(@bookmark.list_id)
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(@bookmark.list), notice: "Bookmark was successfully destroyed.", status: :see_other
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id, :priority)
  end
end
