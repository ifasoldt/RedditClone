class CommentsController < ApplicationController

  def show
    @comment = Comment.find(params[:id])
  end

  def create
    @comment = current_user.comments.create!(
      link_id: params[:link_id],
      body: params[:comment][:body],
      user_id: params[:user_id]
    )
    @comment_serialized = {username: @comment.user.username, id: @comment.id, body: @comment.body, created_at: @comment.created_at, comment_user: @comment.user, comment_link_id: @comment.link_id}
    respond_to do |format|
      format.json {
        #MUST RENDER JSON HERE, ELSE SUCCESS DOESN'T EVEN RUN ON OTHER END!!!!!!!! *BANG HEAD INTO WALL*
        render json: @comment_serialized, status: :created, location: [@comment.link, @comment]
      }
    end
  end
end
