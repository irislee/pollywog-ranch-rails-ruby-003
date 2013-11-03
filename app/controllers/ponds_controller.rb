class PondsController < ApplicationController
  before_action :set_pond, only: [:show, :edit, :update, :destroy]
 
  def index
    @ponds = Pond.all
  end

  def new
    @pond = Pond.new
  end

  def show
  end

  def create
    @pond = Pond.new(pond_params)
    if @pond.save
      redirect_to(@pond)
    end
  end

  def update
    if @pond.update(pond_params)
      redirect_to(@pond)
    end
  end

  def edit
  end

  def destroy
    if @pond.destroy
      redirect_to(ponds_path)
    end
  end

  private

  def set_pond
    @pond = Pond.find(params[:id])
  end

  def pond_params
    params.require(:pond).permit(:name, :water_type)
  end
end




