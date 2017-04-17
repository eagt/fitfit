class MusclesController < ApplicationController
  before_action :set_muscle, only: [:show, :edit, :update, :destroy]
  before_action :set_user

  # GET /muscles
  # GET /muscles.json
  def index
    # set_user, is the only action taken here
  end

  # GET /muscles/1
  # GET /muscles/1.json
  def show
     # set_user
     # set_muscle
  end

  # GET /muscles/new
  def new
    # set_user, action takes place here
    @muscle = Muscle.new
  end

    # POST /muscles
  # POST /muscles.json
  def create
    # set_user, action takes place here
    @muscle = Muscle.new(muscle_params)        
      if @user.muscles << @muscle
        redirect_to user_muscles_path(@user, @muscle), notice: 'Etype was successfully created.' 
    
      else
        format.html { render :new }
        format.json { render json: @muscle.errors, status: :unprocessable_entity }
      end
  end



  # GET /muscles/1/edit
  def edit
     # set_user
     # set_muscle 
  end



  # PATCH/PUT /muscles/1
  # PATCH/PUT /muscles/1.json
  def update
     # set_user
     # set_muscle
    if @muscle.update(muscle_params)
        @user.muscles << @muscle
        redirect_to user_muscles_path(@user, @muscle), notice: 'Exercise was successfully updated.' 
    else
        format.html { render :edit }
        format.json { render json: @muscle.errors, status: :unprocessable_entity }
    end   
  end

  # DELETE /muscles/1
  # DELETE /muscles/1.json
  def destroy
    @muscle.destroy
    respond_to do |format|
      format.html { redirect_to user_muscles_path(@user), notice: 'Muscle was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_muscle
      @muscle = Muscle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def muscle_params
      params.require(:muscle).permit(:name)
    end
end
