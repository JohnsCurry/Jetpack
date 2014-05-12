class SkillsController < ApplicationController
before_action :require_user, except: [:index, :show]


def index
  if params[:tag].present?
    @skills = Skill.tagged_with(params[:tag])
  else
    @skills = Skill.all
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