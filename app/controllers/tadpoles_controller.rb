class TadpolesController < ApplicationController
  before_action :set_tadpole, only: [:show, :edit, :update, :destroy]

  def index
    @tadpoles = Tadpole.all
  end

  def new
    @frog = Frog.find(params[:id])
    @tadpole = Tadpole.new
  end

  def show
  end

  def create
   @frog = Frog.find(params[:tadpole][:frog_id])
    @tadpole = @frog.tadpoles.create(tadpole_params)
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
    # @tadpole = Tadpole.find_by(:id => params[:id])
    @tadpole = Tadpole.find(params[:id])
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
    params.require(:tadpole).permit(:name, :color, :frog_id)
  end
end
