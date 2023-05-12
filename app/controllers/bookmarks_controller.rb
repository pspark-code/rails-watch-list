class BookmarksController < ApplicationController
  before_action :set_list
  def new
    # We need @restaurant in our `simple_form_for`
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = bookmark.new(bookmark_params)
    @bookmark.list = @list
    @bookmark.save
    redirect_to list_path(@list)
  end

  def destroy
    @bookmark.list = @list
    @bookmark.destroy
  end

  private

  def set_list
    @list = List.find(params[:list_id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment)
  end
end
