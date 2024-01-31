class Api::V1::PinsController < Api::V1::ApplicationController

  def index
    @pins = Pin.all

    # render :index
    # render json: @pins

    # puts @pins.as_json(only: :title)

    # render json: @pins.as_json(only: [:title, :description])

    # render json: @pins.map {|pin| pin.api_as_json }
  end

  def show
    @pin = Pin.find(params[:id])
  end

  def create
    jti = request.headers["Authorization"]

    @user = User.find_by_jti(jti)
    @pin = @user.pins.new(pin_params)

    if @pin.save
      render json: @pin.as_json
    else
      render json: @pin.errors, status: :unprocessable_entity
    end
  end

  private
    def pin_params
      params.require(:pin).permit(:title, :description, :pin_image, :tag_list, :category_list)
    end

end
