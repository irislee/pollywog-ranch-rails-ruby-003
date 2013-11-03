class TadpolesController < ApplicationController
  before_action :set_tadpole, only: [:show, :edit, :update, :destroy]

  def index
    @tadpoles = Tadpole.all
  end

  def new
    @tadpole = Tadpole.new
    @frog = Frog.find_by(:id => params[:frog_id])
  end

  def show
  end

  def create
    @tadpole = Tadpole.new(tadpole_params)
    @tadpole.frog = Frog.find_by(:id => params[:frog_id])
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

  private
  def set_tadpole
    @tadpole = Tadpole.find(params[:id])
  end

  def tadpole_params
    params.require(:tadpole).permit(:name, :frog_color, :frog_id)
  end
end
