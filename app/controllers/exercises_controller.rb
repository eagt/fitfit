class ExercisesController < ApplicationController
  before_action :set_exercise, only: [:show, :update, :destroy, :edit] # :edit, deleted for a while

  # GET /exercises
  # GET /exercises.json
  def index
    @user = User.find(params[:user_id])
  end



  # GET /exercises/1
  # GET /exercises/1.json
   def show
     @user = User.find(params[:user_id]) 
   end

  # GET /exercises/new
  def new
    @user = User.find(params[:user_id])
    @exercise = Exercise.new
  end

  # POST /exercises
  # POST /exercises.json
  def create
    @user = User.find(params[:user_id])
    @exercise = Exercise.new(exercise_params)
    respond_to do |format|
      if @exercise.save
        format.html { redirect_to @exercise, notice: 'Exercise was successfully created.' }
        format.json { render :show, status: :created, location: @exercise }
      else
        format.html { render :new }
        format.json { render json: @exercise.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /exercises/1/edit
  def edit
    @user = User.find(params[:user_id])
    @exercise = Exercise.find(params[:id])
  end

  # PATCH/PUT /exercises/1
  # PATCH/PUT /exercises/1.json
  def update    
    @user = User.find(params[:user_id])
    @exercise = Exercise.find(params[:id])
      if @exercise.update(exercise_params)
        @exercise.etypes.delete_all if not(@exercise.etypes.empty?)        
        params[:exercise][:etypes_attributes].each do |etype|
          @exercise.etypes << Etype.find(params[:exercise][:etypes_attributes][etype][:id]) if params[:exercise][:etypes_attributes][etype][:_destroy]=="false"
        end
      end

      if @exercise.update(exercise_params)
        @exercise.muscles.delete_all if not(@exercise.muscles.empty?)        
        params[:exercise][:muscles_attributes].each do |muscle|
          @exercise.muscles << Muscle.find(params[:exercise][:muscles_attributes][muscle][:id]) if params[:exercise][:muscles_attributes][muscle][:_destroy]=="false"
        end
      end

      if @exercise.update(exercise_params)
        @exercise.equipment.delete_all if not(@exercise.equipment.empty?)        
        params[:exercise][:equipment_attributes].each do |equipment|
          @exercise.equipment << Equipment.find(params[:exercise][:equipment_attributes][equipment][:id]) if params[:exercise][:equipment_attributes][equipment][:_destroy]=="false"
        end
      end

       redirect_to user_exercises_path(@user, @exercise), notice: 'Exercise was successfully updated.' 
              
      else
        redirect_to edit_user_exercise_path(@user, @exercise), notice: 'ERROR: Exercise was NOT updated.'        
  end





  # DELETE /exercises/1
  # DELETE /exercises/1.json
  def destroy
    @exercise.destroy
    respond_to do |format|
      format.html { redirect_to user_exercises_path(@user), notice: 'Exercise was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exercise
      @exercise = Exercise.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def exercise_params
      #params.require(:exercise).permit(:id, :name, etypes_attributes: Etype.attribute_names.map(&:to_sym).push(:_destroy))
      params.require(:exercise).permit(:id, :name)

    end
end