class JobsController < ApplicationController
  def index
    @jobs = Job.all
  end

  def new
    @job = Job.new
  end

  def settings
    @job = Job.new
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

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    redirect_to job_path
  end
end
