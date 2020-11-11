class SettingsController < ApplicationController
  def index
    @jobs = Job.all
  end

  def create
    @job = Job.create(params.require(:job).permit(:name))

    if @job.valid?
      redirect_to employees_path
    else
      flash[:errors] = @job.errors.full_messages
      redirect_to new_job_path
    end
  end
end
