class NotaPorCursosController < ApplicationController
  before_action :set_nota_por_curso, only: [:show, :edit, :update, :destroy]
  rescue_from ActiveRecord::RecordNotUnique, with: :faculdade_curso_existem

  # GET /nota_por_cursos
  # GET /nota_por_cursos.json

  def index
    @filterrific = initialize_filterrific(
      NotaPorCurso,
      params[:filterrific],
      :select_options => {
        sorted_by: NotaPorCurso.options_for_sorted_by,
      }
    ) or return
    @nota_por_cursos = @filterrific.find.page(params[:page])
    respond_to do |format|
      format.html
      format.js
    end
  end




  # GET /nota_por_cursos/1
  # GET /nota_por_cursos/1.json
  def show
  end

  # GET /nota_por_cursos/new
  def new
    @nota_por_curso = NotaPorCurso.new
  end

  # GET /nota_por_cursos/1/edit
  def edit
  end

  # POST /nota_por_cursos
  # POST /nota_por_cursos.json
  def create
    @nota_por_curso = NotaPorCurso.new(nota_por_curso_params)
    respond_to do |format|
      if @nota_por_curso.save
        format.html { redirect_to @nota_por_curso, notice: 'Nota por curso was successfully created.' }
        format.json { render :show, status: :created, location: @nota_por_curso }
      else
        format.html { render :new }
        format.json { render json: @nota_por_curso.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /nota_por_cursos/1
  # PATCH/PUT /nota_por_cursos/1.json
  def update
    respond_to do |format|
      if @nota_por_curso.update(nota_por_curso_params)
        format.html { redirect_to @nota_por_curso, notice: 'Nota por curso was successfully updated.' }
        format.json { render :show, status: :ok, location: @nota_por_curso }
      else
        format.html { render :edit }
        format.json { render json: @nota_por_curso.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ponies/1
  # DELETE /ponies/1.json
  def destroy
    @faculdade.destroy
    respond_to do |format|
      format.html { redirect_to faculdades_url, notice: 'Faculdade was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_nota_por_curso
    @nota_por_curso = NotaPorCurso.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def nota_por_curso_params
    params.require(:nota_por_curso).permit(:faculdade_id, :curso_id, :nota, :media_alunos, :media, :nome, :nome_curso)
  end

  def faculdade_curso_existem
    redirect_back(fallback_location: root_path, alert: "Já existem notas cadastradas para esta combinação de faculdade e curso!")
  end

end
