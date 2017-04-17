class EquipmentController < ApplicationController
  before_action :set_equipment, only: [:show, :edit, :update, :destroy]
  before_action :set_user
  # GET /equipment
  # GET /equipment.json
  def index
    # set_user
  end

  # GET /equipment/1
  # GET /equipment/1.json
  def show
     # set_user
     # set_equipment
  end

  # GET /equipment/new
  def new
    # set_user
    @equipment = Equipment.new
  end

  # POST /equipment
  # POST /equipment.json
  def create
    # set_user
   @equipment = Equipment.new(equipment_params)        
      if @user.equipment << @equipment
        redirect_to user_equipment_path(@user, @equipment), notice: 'Equipment was successfully created.' 
    
      else
        format.html { render :new }
        format.json { render json: @equipment.errors, status: :unprocessable_entity }
      end
    end
 
    # GET /equipment/1/edit
  def edit
     # set_user
     # set_equipment
  end

  # PATCH/PUT /equipment/1
  # PATCH/PUT /equipment/1.json
  def update
     # set_user
     # set_equipment
    if @equipment.update(equipment_params)
        @user.equipment << @equipment
        redirect_to user_equipment_path(@user, @equipment), notice: 'Equipment was successfully updated.' 
      else
        format.html { render :edit }
        format.json { render json: @equipment.errors, status: :unprocessable_entity }
    end
  end
  

  # DELETE /equipment/1
  # DELETE /equipment/1.json
  def destroy
    # set_user
    @equipment.destroy
    respond_to do |format|
      format.html { redirect_to user_muscles_index_path(@user), notice: 'Equipment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_equipment
      @equipment = Equipment.find(params[:id])
    end

    def set_user
      @user = User.find(params[:user_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def equipment_params
      params.require(:equipment).permit(:name)
    end
  end
