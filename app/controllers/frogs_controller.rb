class FrogsController < ApplicationController
  
  def index
    @frogs = Frog.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @frogs }
    end
  end 

end


