class FaculdadesController < ApplicationController
  before_action :set_faculdade, only: [:show, :edit, :update, :destroy]

  # GET /faculdades
  # GET /faculdades.json
  def index
    @faculdades = Faculdade.all
  end

  # GET /faculdades/1
  # GET /faculdades/1.json
  def show
  end

  # GET /faculdades/new
  def new
    @faculdade = Faculdade.new
  end

  # GET /faculdades/1/edit
  def edit
  end

  # POST /faculdades
  # POST /faculdades.json
  def create
    @faculdade = Faculdade.new(faculdade_params)

    respond_to do |format|
      if @faculdade.save
        format.html { redirect_to @faculdade, notice: 'Faculdade criada com sucesso!' }
        format.json { render :show, status: :created, location: @faculdade }
      else
        format.html { render :new }
        format.json { render json: @faculdade.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /faculdades/1
  # PATCH/PUT /faculdades/1.json
  def update
    respond_to do |format|
      if @faculdade.update(faculdade_params)
        format.html { redirect_to @faculdade, notice: 'Faculdade editada com sucesso!' }
        format.json { render :show, status: :ok, location: @faculdade }
      else
        format.html { render :edit }
        format.json { render json: @faculdade.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /faculdades/1
  # DELETE /faculdades/1.json
  def destroy
    @faculdade.destroy
    respond_to do |format|
      format.html { redirect_to faculdades_url, notice: 'Faculdade was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_faculdade
      @faculdade = Faculdade.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def faculdade_params
      params.require(:faculdade).permit(:nome, :nota)
    end
end
