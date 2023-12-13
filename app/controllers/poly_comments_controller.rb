class PolyCommentsController < ApplicationController
  load_and_authorize_resource

  def create
    # commentable = nil
    # commentable_id = poly_comment_params[:commentable_id]

    # if poly_comment_params[:commentable_type] == "Pin"
    #   commentable = Pin.find(commentable_id)
    # elsif poly_comment_params[:commentable_type] == "TextPost"
    #   commentable = TextPost.find(commentable_id)
    # elsif poly_comment_params[:commentable_type] == "VideoPost"
    #   commentable = VideoPost.find(commentable_id)
    # elsif poly_comment_params[:commentable_type] == "FigmaPost"
    #   commentable = FigmaPost.find(commentable_id)
    # end

    @poly_comment = PolyComment.new(poly_comment_params)

    respond_to do |format|
      if @poly_comment.save
        format.html { redirect_back fallback_location: root_path, notice: "Comment was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

    def poly_comment_params
      params.require(:poly_comment).permit(:body, :commentable_type, :commentable_id).merge(user_id: current_user.id)
    end
end
