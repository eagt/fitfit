class MeasurementsController < ApplicationController
  before_action :set_measurement, only: [:show, :edit, :update, :destroy]
  before_action :set_user 
  # GET /measurements
  # GET /measurements.json
  def index
   # set_user, is the only action taken here
  end

  # GET /measurements/1
  # GET /measurements/1.json
  def show
    # set_user
    # set_measurement
  end

  # GET /measurements/new
  def new
    # set_user, action takes place here
    @measurement = Measurement.new
  end

  # POST /measurements
  # POST /measurements.json
  def create
     if @measurement = Measurement.new(measurement_params)
        @user.measurements << @measurement
        redirect_to user_measurements_path(@user, @measurement), notice: 'Measurementwas successfully created.' 

      else
        format.html { render :new }
        format.json { render json: @measurement.errors, status: :unprocessable_entity }
      end
    end



  # GET /measurements/1/edit
  def edit
    # set_user
    # set_measurement
  end
  # PATCH/PUT /measurements/1
  # PATCH/PUT /measurements/1.json
  def update   
      if @measurement.update(measurement_params)
         @user.measurements << @measurement
         redirect_to user_measurements_path(@user, @measurement), notice: 'Measurementwas successfully created.'
      else
        format.html { render :edit }
        format.json { render json: @measurement.errors, status: :unprocessable_entity }
      end
    end


  # DELETE /measurements/1
  # DELETE /measurements/1.json
  def destroy
    @measurement.destroy
    respond_to do |format|
      format.html { redirect_to user_measurements_path(@user), notice: 'Measurement was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_measurement
      @measurement = Measurement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def measurement_params
      params.require(:measurement).permit(:user_id, :date, :weight, :weight_unit, :fat_pct)
    end
end
