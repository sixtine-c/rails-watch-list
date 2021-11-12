class BookmarksController < ApplicationController

  def new
    @bookmark = Bookmark.new
    @list = List.find(params[:list_id])
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @list = List.find(params[:list_id])
    @bookmark.list_id = @list.id
    if @bookmark.save
      redirect_to list_path(@list.id)
    else
      render :new
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @list_id = @bookmark.list_id
    @bookmark.destroy
    redirect_to list_path(@list_id)
  end

  private

  def bookmark_params
    params.require(:bookmark).permit([:comment, :list_id, :movie_id])
  end
end
