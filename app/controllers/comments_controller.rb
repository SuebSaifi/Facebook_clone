class CommentsController < ApplicationController
  # def index
  #   @comments = Comment.all
  # end
  # def new
  #   @comment = current_user.commetns.build
  # end
  # def edit
  #   def create
  #     debugger
  #     @post = Facepost.find(params[:facepost_id])
  #     @comment=@post.comments.build(comment_params)
  #     redirect_to facepost_path(@post)
      
  # end
  # def destroy
  #     @post = Facepost.find(params[:facepost_id])
  #     @comment=@post.comments.find(params[:id])
  #     @comment.destroy
  #     redirect_to facepost_path(@post), status: 303
  # end 
      
      
  # end
   def create
     @comment = current_user.comments.build(comments_params)
     if @comment.save
       flash[:success] = "comment successfully created"
       redirect_to @facepost
     else
       flash[:error] = "Something went wrong"
       render 'new'
     end
   end
  #  def update
  #    @comment = Comment.find(params[:id])
  #      if @comment.update_attributes(params[:comment])
  #        flash[:success] = "Comment was successfully updated"
  #        redirect_to @facepost
  #      else
  #        flash[:error] = "Something went wrong"
  #        render 'edit'
  #      end
  #  end
  #  def show
  #    @comment = Comment.find(params[:id])
  #  end
   
  #  def destroy
  #    @comment = Comment.find(params[:id])
  #    if @comment.destroy
  #      flash[:success] = 'Comment was successfully deleted.'
  #      redirect_to @facepost
  #    else
  #      flash[:error] = 'Something went wrong'
  #      redirect_to comments_url
  #    end
  #  end
   private
   
   def comments_params
    params.require(:comment).permit(:comment)
   end
end
