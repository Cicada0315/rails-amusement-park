class AttractionsController < ApplicationController
  def index
    @attractions = Attraction.all
    @user = current_user
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.new(attraction_params)
    if @attraction.save
      redirect_to attraction_path(@attraction)
    else
      render :new, notice: 'Attraction could not be created'
    end
  end

  def show
    @attraction = Attraction.find(params[:id])
    @user = current_user
  end

  def update
    @attraction = Attraction.find(params[:id])
    if @attraction.update(attraction_params)
      redirect_to attraction_path(@attraction), :notice => "You Just Updated The Attraction"
    else
      render 'edit', :notice => "Please Fill In All Forms"
    end
  end

  def edit
    @attraction = Attraction.find(params[:id])
  end

  def destroy
  end

  private
    def attraction_params
      params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
    end
end
