class PinsController < ApplicationController
  load_and_authorize_resource
  before_action :set_pin, only: %i[ show edit update destroy ]
  layout :resolve_layout

  # GET /pins or /pins.json
  def index
    @pins = Pin.all

    # Meta
    # @title = "Пины | Название сервиса"
    # @description = ""
    # @keywords = ""
    # end
  end

  def by_tag
    @pins = Pin.tagged_with(params[:tag])
    render :index
  end

  def by_category
    @pins = Pin.tagged_with(params[:category])
    render :index
  end

  # GET /pins/1 or /pins/1.json
  def show
    # Meta
    @title = "#{@pin.title} | Название сервиса"
    # end
  end

  # GET /pins/new
  def new
    @pin = Pin.new
  end

  # GET /pins/1/edit
  def edit
  end

  # POST /pins or /pins.json
  def create
    @pin = Pin.new(pin_params)

    respond_to do |format|
      if @pin.save
        format.html { redirect_to pin_url(@pin), notice: "Pin was successfully created." }
        format.json { render :show, status: :created, location: @pin }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @pin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pins/1 or /pins/1.json
  def update
    respond_to do |format|
      if @pin.update(pin_params)
        format.html { redirect_to pin_url(@pin), notice: "Pin was successfully updated." }
        format.json { render :show, status: :ok, location: @pin }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pins/1 or /pins/1.json
  def destroy
    @pin.destroy

    respond_to do |format|
      format.html { redirect_to pins_url, notice: "Pin was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pin
      @pin = Pin.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pin_params
      params.require(:pin).permit(:title, :description, :pin_image, :tag_list, :category_list).merge(user_id: current_user.id)
    end

    def resolve_layout
      case action_name
      when "show"
        "custom"
      when "index"
        "pins"
      else
        "application"
      end
    end
end
