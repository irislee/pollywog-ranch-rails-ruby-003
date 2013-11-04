class TadpolesController < ApplicationController
  before_action :set_tadpole, only: [:show, :edit, :update, :destroy]

  def index
    @tadpoles = Tadpole.all
  end

  def new
    @frog = Frog.find_by(:id => params[:id])
    @tadpole = Tadpole.new
  end

  def show
  end

  def create
   @tadpole = Tadpole.new(tadpole_params)
   @frog = Frog.find_by(:id => params[:id])
    if @tadpole.save
      redirect_to(@tadpole)
    end
  end

  def update
    if @tadpole.update(tadpole_params)
      redirect_to(@tadpole)
    end
  end

  def edit
    @tadpoles = Tadpole.all
  end

  def destroy
    if @tadpole.destroy
      redirect_to(tadpoles_path)
    end
  end

  def evolve
    @tadpole = Tadpole.find_by(:id => params[:id])
    @frog = Frog.new
    @frog.name = @tadpole.name
    @frog.color = @tadpole.color
    @frog.pond = @tadpole.frog.pond
    if @frog.save && @tadpole.destroy
      redirect_to(@frog)
    end
  end

  private
  def set_tadpole
    @tadpole = Tadpole.find(params[:id])
  end

  def tadpole_params
    # params.require(:frog).permit(tadpole: [:name, :frog_color, :frog_id])
    params.require(:tadpole).permit(:name, :color, :frog_id)
  end
end
