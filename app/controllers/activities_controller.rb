class ActivitiesController < ApplicationController

  def index
    @activities = current_user.activities
  end

  def show
    @activity = current_user.activities.find(params[:id])
  end

  def new
    @activity = current_user.activities.build
  end

  def create
    @activity = current_user.activities.build(activity_params)

    if @activity.save
      redirect_to @activity
    else
      render "new"
    end
  end

  def edit
    @activity = current_user.activities.find(params[:id])
  end

  def update
    @activity = current_user.activities.find(params[:id])

    if @activity.update(activity_params)
      redirect_to @activity
    else
      render "edit"
    end
  end

  def destroy
    @activity = current_user.activities.find(params[:id])
    @activity.destroy
    redirect_to activities_path
  end

  private

  def activity_params
    params.require(:activity).permit(:name, :date, :duration, :activity_name_id)
  end

end
