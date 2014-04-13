class ReferencesController < ApplicationController
before_action :require_user, except: [:show]

def index
  if current_user.status == 'career/education'
    @references = Reference.all.where(user_id: current_user)
  else
    @references = Reference.all.where(user_id: params[:id])
  end
end

def new
  @reference = Reference.new
end

def create
  @reference = Reference.new(reference_params)
  @reference.creator = current_user

  if @reference.save
    flash[:notice] = "your reference was added"
    redirect_to references_path
  end
end

def show
  @references = Reference.all.where(user_id: params[:id])
end
private

def reference_params
  params.require(:reference).permit!
end

end