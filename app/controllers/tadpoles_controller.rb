class TadpolesController < ApplicationController
  before_action :set_tadpole, only: [:show, :edit, :update, :destroy]

  def index
    @tadpoles = Tadpole.all
  end

  def new
    @tadpoles = Tadpole.new
    @frog = Frog.all
  end

  def show
  end

  def create
  end

  def update
  end

  def edit
  end

  def destroy
  end

  private
  def set_tadpole
    @tadpole = Tadpole.find(params[:id])
  end

  def tadpole_params
    params.require(:tadpole).permit(:name, :color)
  end
end
