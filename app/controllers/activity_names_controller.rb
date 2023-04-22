class ActivityNamesController < ApplicationController
  before_action :set_activity_name, only: %i[ show edit update destroy ]

  # GET /activity_names or /activity_names.json
  def index
    @activity_names = ActivityName.all
  end

  # GET /activity_names/1 or /activity_names/1.json
  def show
  end

  # GET /activity_names/new
  def new
    @activity_name = ActivityName.new
  end

  # GET /activity_names/1/edit
  def edit
  end

  # POST /activity_names or /activity_names.json
  def create
    @activity_name = ActivityName.new(activity_name_params)

    respond_to do |format|
      if @activity_name.save
        format.html { redirect_to activity_name_url(@activity_name), notice: "Activity name was successfully created." }
        format.json { render :show, status: :created, location: @activity_name }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @activity_name.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /activity_names/1 or /activity_names/1.json
  def update
    respond_to do |format|
      if @activity_name.update(activity_name_params)
        format.html { redirect_to activity_name_url(@activity_name), notice: "Activity name was successfully updated." }
        format.json { render :show, status: :ok, location: @activity_name }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @activity_name.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activity_names/1 or /activity_names/1.json
  def destroy
    @activity_name.destroy

    respond_to do |format|
      format.html { redirect_to activity_names_url, notice: "Activity name was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_activity_name
      @activity_name = ActivityName.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def activity_name_params
      params.require(:activity_name).permit(:name)
    end
end
