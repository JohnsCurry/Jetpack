class JobsController < ApplicationController
before_action :require_user, only: [:new] 

  def index

    if params[:search].present? && params[:tag].present?
      @jobs = Job.near(params[:search], params[:miles]).tagged_with(params[:tag])

    elsif params[:search].present?
      @users = User.near(params[:search], params[:miles])
      @jobs = Job.near(params[:search], params[:miles])
      #@jobs = Job.near search && tagged_with params tag.
  
    elsif params[:tag]
      @users = User.tagged_with(params[:tag])
      @jobs = Job.tagged_with(params[:tag])
    else
      @users = User.all
      @jobs = Job.all
    end

  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.create(job_params)
    @job.user_id = current_user.id

    if @job.save
      flash[:notice] = "New Job Saved"
      redirect_to job_path(id: current_user.id)
    else
      render :new
    end
  end

  def show
    @jobs = Job.all.where(user_id: params[:id])
    @job  = Job.find_by(id: params[:id])
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])
    if @job.update(job_params)
      flash[:notice] = "Your Job post was updated"
      redirect_to job_path(id: current_user.id)
    else
      render :edit
    end
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    redirect_to job_path(id: current_user.id)
  end


  private

  def job_params
    params.require(:job).permit!
  end

  

end