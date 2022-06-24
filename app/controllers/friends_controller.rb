class FriendsController < ApplicationController
def index
    @friends = User.all
end

def new
@friend=current_user.friends.build
end
def create
    @friend = current_user.friends.build(params[:friends])
    if @friend.save
      flash[:success] = "Friend successfully created"
      redirect_to friends_path
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
end
def show
@friend=Friend.find(params[:id])

end
def destroy
    @friend = Friend.find(params[:id])
    if @friend.destroy
        flash[:success] = 'Friend was successfully deleted.'
        redirect_to friends_url
    else
        flash[:error] = 'Something went wrong'
        redirect_to friends_url
    end
end


private 
def friend_params
params.require(:friends).permit(:user_id)
end   
end
