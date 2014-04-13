class SkillsController < ApplicationController
before_action :require_user, except: [:index, :show]


def index
@skills = Skill.all
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

private

def skill_params
params.require(:skill).permit!
end

end