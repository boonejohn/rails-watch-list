class BookmarksController < ApplicationController
  def index
    @bookmark = Bookmark.all
  end

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)

    if @bookmark.save
      redirect_to @bookmark, notice: 'bookmark was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def delete
    @bookmark.destroy
    redirect_to bookmark_url, notice: 'Bookmark was successfully destroyed.'
  end

  private

  def set_bookmark
    @bookmark = bookmark.find(params[:id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id, :list_id)
  end
end
