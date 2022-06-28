class FacepostsController < ApplicationController
  before_action :set_facepost, only: %i[ show edit update destroy ]
  before_action :authenticate_user!,except: [:index,:show]
  # GET /faceposts or /faceposts.json
  def index
    @faceposts = Facepost.all
    @users=User.all
    @facepost=Facepost.new
    @like=Like.all
    @comments=Comment.all
  end

  # GET /faceposts/1 or /faceposts/1.json
  # def show
  # end

  # GET /faceposts/new
  def new
    @facepost = current_user.faceposts.build
    # @comment=current_user.comments.build
  end
  def show
    @facepost = Facepost.find(params[:id])
    @comment=Comment.find(params[:id])
  end
  
  # GET /faceposts/1/edit
  def edit
  end

  # POST /faceposts or /faceposts.json
  def create  
  @facepost = current_user.faceposts.build(facepost_params)
    respond_to do |format|
      if @facepost.save
        format.html { redirect_to root_path, notice: "Facepost was successfully created." }
        format.json { render :show, status: :created, location: @facepost }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @facepost.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /faceposts/1 or /faceposts/1.json
  def update
    respond_to do |format|
    
      if @facepost.update(facepost_params)
        format.html { redirect_to facepost_url(@facepost), notice: "Facepost was successfully updated." }
        format.json { render :show, status: :ok, location: @facepost }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @facepost.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /faceposts/1 or /faceposts/1.json
  def destroy
  # debugger
    @facepost.destroy
    # @comment.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: "Facepost was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_facepost
      @facepost = Facepost.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def facepost_params
      params.require(:facepost).permit(:post)
    end
end
