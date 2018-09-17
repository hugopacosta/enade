class NotaPorCursosController < ApplicationController
  before_action :set_nota_por_curso, only: [:show, :edit, :update, :destroy]

  # GET /nota_por_cursos
  # GET /nota_por_cursos.json
  def index
    @nota_por_cursos = NotaPorCurso.all
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

  # DELETE /nota_por_cursos/1
  # DELETE /nota_por_cursos/1.json
  def destroy
    @nota_por_curso.destroy
    respond_to do |format|
      format.html { redirect_to nota_por_cursos_url, notice: 'Nota por curso was successfully destroyed.' }
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
      params.require(:nota_por_curso).permit(:faculdade_id, :curso_id, :nota, :media_alunos)
    end
end
