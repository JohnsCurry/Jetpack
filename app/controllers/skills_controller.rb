class SkillsController < ApplicationController
before_action :require_user, except: [:index, :show]


def index
  if params[:tag].present?
    @skills = Skill.tagged_with(params[:tag]).paginate(:page => params[:page], :per_page => 5)
  else
    @skills = Skill.all.paginate(:page => params[:page], :per_page => 5)
  end
end

def new
@skill = Skill.new
end

def create
  @skill = Skill.new(skill_params)

  if @skill.save
    flash[:notice] = "New Skill saved"
    redirect_to skill_path(@skill)
  else
    render :new
  end
end

def edit
  @skill = Skill.find(params[:id])
end

def update
  @skill = Skill.find(params[:id])
  if @skill.update(skill_params)
    flash[:notice] = "Skill was updated"
    redirect_to skills_path
  else
    render :edit
  end
end

def show
end

def destroy
  @skill = Skill.find(params[:id])
  @skill.destroy
  redirect_to skill_path, notice: "Skill was destroyed"
end

private

def skill_params
params.require(:skill).permit!
end

end