class ProfilePicturesController < ApplicationController
  before_action :set_profile_picture, only: %i[ show edit update destroy ]

  # GET /profile_pictures or /profile_pictures.json
  def index
    @profile_pictures = ProfilePicture.all
  end

  # GET /profile_pictures/1 or /profile_pictures/1.json
  def show
  end

  # GET /profile_pictures/new
  def new
    @profile_picture = ProfilePicture.new
  end

  # GET /profile_pictures/1/edit
  def edit
  end

  # POST /profile_pictures or /profile_pictures.json
  def create
    @profile_picture = ProfilePicture.new(profile_picture_params)

    respond_to do |format|
      if @profile_picture.save
        format.html { redirect_to profile_picture_url(@profile_picture), notice: "Profile picture was successfully created." }
        format.json { render :show, status: :created, location: @profile_picture }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @profile_picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profile_pictures/1 or /profile_pictures/1.json
  def update
    respond_to do |format|
      if @profile_picture.update(profile_picture_params)
        format.html { redirect_to profile_picture_url(@profile_picture), notice: "Profile picture was successfully updated." }
        format.json { render :show, status: :ok, location: @profile_picture }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @profile_picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profile_pictures/1 or /profile_pictures/1.json
  def destroy
    @profile_picture.destroy

    respond_to do |format|
      format.html { redirect_to profile_pictures_url, notice: "Profile picture was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile_picture
      @profile_picture = ProfilePicture.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def profile_picture_params
      params.require(:profile_picture).permit(:image, :profile_id)
    end
end
