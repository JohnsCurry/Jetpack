class UserSkillsController < ApplicationController
before_action :require_user, only: [:new]
def index
  if current_user == nil || current_user.status == 'career/education'
    @user_skills = UserSkill.all.where(user_id: params[:id])
  else
    @user_skills = UserSkill.all.where(user_id: params[:id])
  end
end

def new
 @skill = Skill.find_by(id: params[:skill_id])
  @user_skill = UserSkill.new :user_id => current_user, :title => @skill.title, :url => @skill.url, :description => @skill.description

 respond_to do |format|
    format.html # new.html.erb
    format.xml  { render :xml => @post }
  end
end

def create
  @user_skill = UserSkill.new(user_skill_params)
  @user_skill.user = current_user 
  if @user_skill.save
    flash[:notice] = "Saved!"
    redirect_to user_skills_path(current_user.id)
  end
end

#def show
#  @user_skills = UserSkill.all.where(user_id: current_user)

#end

def edit
  @user_skill = UserSkill.find_by(id: params[:id])
end

def show
  @user = User.find_by(id: params[:id])

  if current_user == nil || current_user.status == 'career/education'
    @user_skills = UserSkill.all.where(user_id: params[:id])
  else
    @user_skills = UserSkill.all.where(user_id: params[:id])
  end

end

def update
  @user_skill = UserSkill.find_by(id: params[:id])
  if @user_skill.update(user_skill_params)
    flash[:notice] = "Marked as complete!"
    redirect_to user_skills_path
  else
    render :edit
  end
end


private

def user_skill_params
params.require(:user_skill).permit!
end


end