class UniversidadesController < ApplicationController
  before_action :fix_fields
  before_action :set_universidade, only: [:show, :edit, :update, :destroy]

  # GET /universidades
  # GET /universidades.json
  def index
    @universidades = Universidade.all
  end

  # GET /universidades/1
  # GET /universidades/1.json
  def show
  end

  # GET /universidades/new
  def new
    @universidade = Universidade.new
  end

  # GET /universidades/1/edit
  def edit
  end

  # POST /universidades
  # POST /universidades.json
  def create
    @universidade = Universidade.new(universidade_params)

    respond_to do |format|
      if @universidade.save
        format.html { redirect_to @universidade, notice: 'Universidade cadastrada com sucesso!' }
        format.json { render :show, status: :created, location: @universidade }
      else
        format.html { render :new }
        format.json { render json: @universidade.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /universidades/1
  # PATCH/PUT /universidades/1.json
  def update
    respond_to do |format|
      if @universidade.update(universidade_params)
        format.html { redirect_to @universidade, notice: 'Universidade atualizada com sucesso!' }
        format.json { render :show, status: :ok, location: @universidade }
      else
        format.html { render :edit }
        format.json { render json: @universidade.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /universidades/1
  # DELETE /universidades/1.json
  def destroy
    @universidade.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Universidade deletada com sucesso!' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_universidade
    @universidade = Universidade.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def universidade_params
    params.require(:universidade).permit(:nome, :nota)
  end

  def fix_fields
    if params[:universidade].present?
      params[:universidade][:nota] = params[:universidade][:nota].to_s.gsub(',', '.').to_f
    end
  end
end
