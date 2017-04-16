class EtypesController < ApplicationController
  before_action :set_etype, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:index, :new, :create, :show, :edit, :update, :destroy]

  # GET /etypes
  # GET /etypes.json
  def index
   # set_user
  end

  # GET /etypes/1
  # GET /etypes/1.json
  def show
    # set_user
  end

  # GET /etypes/new
  def new
    # set_user
    @etype = Etype.new
  end

  # POST /etypes
  # POST /etypes.json
  def create
    # set_user
    @etype = Etype.new(etype_params)        
      if @user.etypes << @etype
        redirect_to user_etypes_path(@user, @etype), notice: 'Etype was successfully created.' 
    
      else
        format.html { render :new }
        format.json { render json: @etype.errors, status: :unprocessable_entity }
      
    end
  end


  # GET /etypes/1/edit
  def edit
    # set_user
  end
  # PATCH/PUT /etypes/1
  # PATCH/PUT /etypes/1.json
  def update
    # set_user
    if @etype.update(etype_params)
        @user.etypes << @etype
        redirect_to user_etypes_path(@user, @etype), notice: 'Exercise was successfully updated.' 
      else
        format.html { render :edit }
        format.json { render json: @etype.errors, status: :unprocessable_entity }
      
    end
  end

  # DELETE /etypes/1
  # DELETE /etypes/1.json
  def destroy
    # set_user
    @etype.destroy
    respond_to do |format|
      format.html { redirect_to user_etypes_path(@user), notice: 'Etype was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_etype
      @etype = Etype.find(params[:id])
    end

    def set_user
      @user = User.find(params[:user_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def etype_params
      params.require(:etype).permit(:name)
    end
end
