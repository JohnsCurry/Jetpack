class UsersController < ApplicationController

def index
  #if params[:tag_id]
  #  binding.pry
  #  @tags = Tag.all

    #@users = User.all.where(self.tags == params[:tag_id])
    #@users = User.includes(:tags).where('tags.id IN ?', params[:tag_id])
  #else
  #  binding.pry
  #  @tags = Tag.all
    @users = User.all
  #  binding.pry
  #end
  #@users = User.search(params[:search])
end

def new
  @user = User.new
end

def create
  @user = User.new(user_params)

  if @user.save
    #UserMailer.registration_confirmation(@user).deliver
  session[:user_id] = @user.id
    if @user.status == 'career/education'
      flash[:notice] = "Glad to have you! To get started, why don't you add any college courses you have taken to your degree page?"
      redirect_to courses_path
    else
      flash[:notice] = 'Welcome! Feel free to search our user base and find a team member that fits your company culture.'
      redirect_to jobs_path
    end
  else
    flash[:error] = "This username/email might already be taken, sorry!"
    render :new
  end
end

def edit
  @user = User.find(params[:id])
end

def update
  @user = User.find(params[:id])
  if @user.update(user_params)
    flash[:notice] = "Your Profile was updated"
    redirect_to user_skill_path
  else
    render :edit
  end
end

def show
  @user = User.find_by(id: params[:id])
end

def welcome
  @jobs =   Job.all
  @skills = Skill.all

end


private



def user_params
  params.require(:user).permit!
end

end