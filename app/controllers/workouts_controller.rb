class WorkoutsController < ApplicationController
  before_action :set_workout, only: [:show, :edit, :update, :destroy]
  before_action :set_user 
  # GET /workouts
  # GET /workouts.json
  def index
    # set_user, is the only action taken here
  end

  # GET /workouts/1
  # GET /workouts/1.json
  def show
    # set_user
    # set_workout
  end

  # GET /workouts/new
  def new
    # set_user
    @workout = Workout.new
  end

  # POST /workouts
  # POST /workouts.json
  def create
    # set_user
    @workout = Workout.new(workout_params)
      if @user.workouts << @workout
        redirect_to user_workouts_path, notice: 'Workout was successfully created.' 
      else
        format.html { render :new }
        format.json { render json: @workout.errors, status: :unprocessable_entity }
      end
  end


  # GET /workouts/1/edit
  def edit
    # set_user
    # set_workout
  end

  # PATCH/PUT /workouts/1
  # PATCH/PUT /workouts/1.json
  def update
    # set_user
    # set_workout
    if @workout.update(workout_params)
        @user.workouts << @workout
        redirect_to user_workouts_path(@user, @workout), notice: 'Workout was successfully updated.'
      else
        format.html { render :edit }
        format.json { render json: @workout.errors, status: :unprocessable_entity }
      end
  end

  # DELETE /workouts/1
  # DELETE /workouts/1.json
  def destroy
    @workout.destroy
    respond_to do |format|
      format.html { redirect_to user_workouts_path(@user), notice: 'Workout was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_workout
      @workout = Workout.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def workout_params
      params.require(:workout).permit(:user_id, :name, :date, :lifted_weight, :weight_unit, :repetitions)
    end
end
