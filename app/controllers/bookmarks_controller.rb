class BookmarksController < ApplicationController
  def new
    @bookmarks = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.save
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    # No need for app/views/restaurants/destroy.html.erb
    redirect_to bookmark_path, status: :see_other
  end

  def list_params
    params.require(:bookmark).permit(:comment)
  end
end
