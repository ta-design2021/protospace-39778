class PrototypesController < ApplicationController

  def index
    # @prototype = @..includes(:)
  end

  def new
    @prototype = Prototype.new
  end

  def create
    if @prototype.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end


  private
  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end

end
