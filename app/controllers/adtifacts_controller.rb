class AdtifactsController < ApplicationController
  before_action :set_adtifact, only: [:show, :edit, :update, :destroy]

  # GET /adtifacts
  # GET /adtifacts.json
  def index
    @adtifacts = Adtifact.all
  end

  # GET /adtifacts/1
  # GET /adtifacts/1.json
  def show
  end

  # GET /adtifacts/new
  def new
    @adtifact = Adtifact.new
  end

  # GET /adtifacts/1/edit
  def edit
  end

  # POST /adtifacts
  # POST /adtifacts.json
  def create
    @adtifact = Adtifact.new(adtifact_params)

    respond_to do |format|
      if @adtifact.save
        format.html { redirect_to @adtifact, notice: 'Adtifact was successfully created.' }
        format.json { render :show, status: :created, location: @adtifact }
      else
        format.html { render :new }
        format.json { render json: @adtifact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /adtifacts/1
  # PATCH/PUT /adtifacts/1.json
  def update
    respond_to do |format|
      if @adtifact.update(adtifact_params)
        format.html { redirect_to @adtifact, notice: 'Adtifact was successfully updated.' }
        format.json { render :show, status: :ok, location: @adtifact }
      else
        format.html { render :edit }
        format.json { render json: @adtifact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /adtifacts/1
  # DELETE /adtifacts/1.json
  def destroy
    @adtifact.destroy
    respond_to do |format|
      format.html { redirect_to adtifacts_url, notice: 'Adtifact was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_adtifact
      @adtifact = Adtifact.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def adtifact_params
      params.require(:adtifact).permit(:name, :key, :project_id)
    end
end
