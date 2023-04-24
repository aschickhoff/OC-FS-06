class ActivitiesController < ApplicationController
  before_action :set_activity, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /activities or /activities.json
  def index
    @activities = current_user.activities.includes(:activity_name)

    if params[:activity_name_id].present?
      @activities = @activities.where(activity_name_id: params[:activity_name_id])
    end
    
    if params[:start_date].present? && params[:end_date].present?
      @activities = @activities.where(date: params[:start_date]..params[:end_date])
    end
    
    if params[:min_duration].present?
      @activities = @activities.where("duration >= ?", params[:min_duration].to_i)
    end
    
    if params[:max_duration].present?
      @activities = @activities.where("duration <= ?", params[:max_duration].to_i)
    end
    
    if params[:sort].present? && params[:direction].present?
      @activities = @activities.order("#{params[:sort]} #{params[:direction]}")
    end
    
    @activities = @activities.page(params[:page]).per(10)
  end
  


  # GET /activities/1 or /activities/1.json
  def show
    @activity = current_user.activities.find(params[:id])
  end

  # GET /activities/new
  def new
    # @activity = Activity.new
    @activity = current_user.activities.build
  end

  # GET /activities/1/edit
  def edit
    @activity = current_user.activities.find(params[:id])
  end

  # POST /activities or /activities.json
  def create
    # @activity = Activity.new(activity_params)
    @activity = current_user.activities.build(activity_params)
    duration_in_minutes = @activity.duration.to_i + (params[:activity][:duration_hours].to_i * 60) + params[:activity][:duration_minutes].to_i
    @activity.duration = duration_in_minutes
    # puts activity_params[:activity_name_id]
    respond_to do |format|
      if @activity.save
        format.html { redirect_to activity_url(@activity), notice: "Activity was successfully created." }
        format.json { render :show, status: :created, location: @activity }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /activities/1 or /activities/1.json
  def update
    @activity = current_user.activities.find(params[:id])
    duration_in_minutes = @activity.duration.to_i + (params[:activity][:duration_hours].to_i * 60) + params[:activity][:duration_minutes].to_i
    @activity.duration = duration_in_minutes
    respond_to do |format|
      if @activity.update(activity_params)
        format.html { redirect_to activity_url(@activity), notice: "Activity was successfully updated." }
        format.json { render :show, status: :ok, location: @activity }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activities/1 or /activities/1.json
  def destroy
    @activity = current_user.activities.find(params[:id])
    @activity.destroy

    respond_to do |format|
      format.html { redirect_to activities_url, notice: "Activity was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_activity
      # @activity = Activity.find(params[:id])
      @activity = current_user.activities.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def activity_params
      puts params.inspect
      # params.require(:activity).permit(:name, :date, :duration)
      params.require(:activity).permit(:activity_name_id, :date, :duration, :user_id)
    end
end
