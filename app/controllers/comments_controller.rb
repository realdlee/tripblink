class CommentsController < ApplicationController
  def create
    @country = Country.find(params[:country_id])
    @comment = @country.comments.create(comments_params)
    redirect_to @country
  end

  private

  def comments_params
    params.require(:comment).permit(:content, :commentable_type, :commentable_id)
  end

end