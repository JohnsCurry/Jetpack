class ResumesController < ApplicationController
  def index
    if current_user.status == 'career/education'
      @resumes = Resume.all.where(user_id: current_user)
    else
      @resumes = Resume.all.where(user_id: params[:id])
    end
  end

  def new
    @resume = Resume.new
  end

  def create
    @resume = Resume.new(resume_params)
    @resume.creator = current_user

    if @resume.save
      redirect_to resumes_path, notice: "The document #{@resume.name} has been uploaded."
    else
      render "new"
    end
  end

  def destroy
    @resume = Resume.find(params[:id])
    @resume.destroy
    redirect_to resumes_path, notice: "The document #{@resume.name} has been deleted."
  end

private

  def resume_params
    params.require(:resume).permit(:name, :attachment)
  end
end
