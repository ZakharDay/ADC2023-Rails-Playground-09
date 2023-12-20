class CommentsController < ApplicationController
  before_action :set_comment, only: %i[ show edit update destroy ]
  before_action :set_pin, only: %i[ create ]

  def edit
    @pin = @comment.pin
  end

  # POST /comments or /comments.json
  def create
    @comment = Comment.new(comment_params.merge(pin_id: @pin.id))

    respond_to do |format|
      if @comment.save
        format.html { redirect_to pin_url(@pin), notice: "Comment was successfully created." }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @pin = @comment.pin

    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to pin_url(@pin), notice: "Comment was successfully updated." }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def set_pin
      @pin = Pin.friendly.find(params[:pin_id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:body).merge(user_id: current_user.id)
    end
end
