class LikesController < ApplicationController
before_action :find_facepost
def index
  @likes =Like.all
end

# def update
#   @object = Object.find(params[:id])
#     if @object.update_attributes(params[:object])
#       flash[:success] = "Object was successfully updated"
#       redirect_to @object
#     else
#       flash[:error] = "Something went wrong"
#       render 'edit'
#     end
# end

def new
  @like = Like.new
end

# @like = Like.find(params[:like_id])
def create

# @facepost=Facepost.find(params[:facepost_id])
@user=current_user.id
if already_liked?
    flash[:notice] = "You can't like more than once"
  else 
  @like= Like.create(facepost_id: params[:facepost_id],user_id: current_user.id)
  redirect_to root_path
  end
end
# def destroy
#   if !(already_liked?)
#     flash[:notice] = "Cannot unlike"
#   else
#     @like.destroy
#   end
#   redirect_to post_path(@facepost)
# end
private
def find_facepost
@facepost=Facepost.find(params[:facepost_id])
end

def already_liked?
Like.where(user_id: current_user.id, facepost_id:params[:facepost_id]).exists?
end
end
