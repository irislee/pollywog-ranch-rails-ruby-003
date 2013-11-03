class FrogsController < ApplicationController
  before_action :set_frog, only: [:show, :edit, :update, :destroy]
  def index
    @frogs = Frog.all
  end 

  def new
    @frog = Frog.new
    @ponds = Pond.all
  end

  def show
  end

  def create
    @frog = Frog.new(frog_params)
    if @frog.save
      redirect_to(@frog)
    end
  end

  def update
    if @frog.update(frog_params)
      redirect_to(@frog)
    end
  end

  def edit
    @ponds = Pond.all
  end

  def destroy
    if @frog.destroy
      redirect_to(frogs_path)
    end
  end


  private

  def set_frog
    @frog = Frog.find(params[:id])
  end

  def frog_params
    params.require(:frog).permit(:name, :color, :pond_id)
  end

end


