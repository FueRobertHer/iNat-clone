class Api::ObservationsController < ApplicationController

  def index
    @observations = Observation.all
    render :index
  end

  def show
    @observation = Observation.find(params[:id])
    render :show
  end

  # def new
  #   @observation = Observation.new
  #   render :new
  # end

  def create
    @observation = Observation.new(obs_params)
    if @observation.save
      render :show
    else
      render json: @observation.errors.full_messages, status: 422
    end
  end

  # def edit
  #   @observation = Observation.find(params[:id])
  #   if @observation.observer_id == current_user.id
  #     render :edit
  #   else
  #     render :show
  #   end
  # end

  def update
    @observation = Observation.find(params[:id])
    if @observation.observer_id == current_user.id
      if @observation.update(obs_params)
        render :show
      else
        render json: @observation.errors.full_messages, status: 422
      end
    end
  end

  def destroy
    @observation = Observation.find(params[:id])
    if @observation.observer_id == current_user.id
      @observation.destroy
      render :show
    else
      render json: ['did not delete observation']
    end
  end

  private

  def obs_params
    params.require(:observation).permit(:observer_id, :lat, :lng, :description, :datetime)
  end

end
