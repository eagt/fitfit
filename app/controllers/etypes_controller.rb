class EtypesController < ApplicationController
  before_action :set_etype, only: [:show, :edit, :update, :destroy]

  # GET /etypes
  # GET /etypes.json
  def index
    @etypes = Etype.all
  end

  # GET /etypes/1
  # GET /etypes/1.json
  def show
  end

  # GET /etypes/new
  def new
    @etype = Etype.new
  end

  # GET /etypes/1/edit
  def edit
  end

  # POST /etypes
  # POST /etypes.json
  def create
    @etype = Etype.new(etype_params)

    respond_to do |format|
      if @etype.save
        format.html { redirect_to @etype, notice: 'Etype was successfully created.' }
        format.json { render :show, status: :created, location: @etype }
      else
        format.html { render :new }
        format.json { render json: @etype.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /etypes/1
  # PATCH/PUT /etypes/1.json
  def update
    respond_to do |format|
      if @etype.update(etype_params)
        format.html { redirect_to @etype, notice: 'Etype was successfully updated.' }
        format.json { render :show, status: :ok, location: @etype }
      else
        format.html { render :edit }
        format.json { render json: @etype.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /etypes/1
  # DELETE /etypes/1.json
  def destroy
    @etype.destroy
    respond_to do |format|
      format.html { redirect_to etypes_url, notice: 'Etype was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_etype
      @etype = Etype.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def etype_params
      params.require(:etype).permit(:name)
    end
end
