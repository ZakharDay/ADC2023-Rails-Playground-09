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

end
