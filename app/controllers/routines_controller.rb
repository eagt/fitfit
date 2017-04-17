class RoutinesController < ApplicationController
  before_action :set_routine, only: [:show, :edit, :update, :destroy]
  before_action :set_user 
  # GET /routines
  # GET /routines.json
  def index
    # set_user, is the only action taken here
  end

  # GET /routines/1
  # GET /routines/1.json
  def show
    # set_user
    # set_routine
  end

  # GET /routines/1/edit
  def edit
    # set_user
    # set_routine
  end


  # GET /routines/new
  def new
    # set_user, action takes place here
    @routine = Routine.new
  end

  # POST /routines
  # POST /routines.json
  def create
    # set_user
    @routine = Routine.new(routine_params)
      if @user.routines << @routine
        redirect_to user_routines_path, notice: 'Routine was successfully created.' 
      else
        format.html { render :new }
        format.json { render json: @routine.errors, status: :unprocessable_entity }
      end  
  end

  def edit
    # set_user
    # set_routine
  end

  # PATCH/PUT /routines/1
  # PATCH/PUT /routines/1.json
  def update
    # set_user
    # set_routine
    if @routine.update(routine_params)
        @user.routines << @routine
        redirect_to user_routines_path(@user, @routine), notice: 'Exercise was successfully updated.' 
    else
        format.html { render :edit }
        format.json { render json: @routine.errors, status: :unprocessable_entity }
    end
   
  end

  # DELETE /routines/1
  # DELETE /routines/1.json
  def destroy
    # set_user, action takes place here
    @routine.destroy
    respond_to do |format|
      format.html { redirect_to user_routines_path(@user), notice: 'Routine was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_routine
      @routine = Routine.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def routine_params
      params.require(:routine).permit(:user_id, :name, :date, :weekly_frequency, :days)
    end
end
