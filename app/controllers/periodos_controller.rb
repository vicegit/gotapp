class PeriodosController < ApplicationController
  load_and_authorize_resource
  before_action :set_periodo, only: [:show, :edit, :update, :destroy]

  # GET /periodos
  # GET /periodos.json
  def index
    @periodos = Periodo.all
  end

  # GET /periodos/1
  # GET /periodos/1.json
  def show
  end

  # GET /periodos/new
  def new
    @periodo = Periodo.new
  end

  # GET /periodos/1/edit
  def edit
  end

  # POST /periodos
  # POST /periodos.json
  def create
    @periodo = Periodo.new(periodo_params)

    respond_to do |format|
      if @periodo.save
        format.html { redirect_to @periodo, notice: 'El período fue creado.' }
        format.json { render :show, status: :created, location: @periodo }
      else
        format.html { render :new }
        format.json { render json: @periodo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /periodos/1
  # PATCH/PUT /periodos/1.json
  def update
    respond_to do |format|
      if @periodo.update(periodo_params)
        format.html { redirect_to @periodo, notice: 'El período fue actualizado.' }
        format.json { render :show, status: :ok, location: @periodo }
      else
        format.html { render :edit }
        format.json { render json: @periodo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /periodos/1
  # DELETE /periodos/1.json
  def destroy
    @periodo.destroy
    respond_to do |format|
      format.html { redirect_to periodos_url, notice: 'El período fue eliminado.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_periodo
      @periodo = Periodo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def periodo_params
      params.require(:periodo).permit(:periodo, :fecha_vencimiento, :estado_periodo)
    end
end
