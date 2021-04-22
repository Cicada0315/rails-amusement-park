class RidesController < ApplicationController
  def new
  end

  def create
    user = User.find(params[:user_id])
    attraction = Attraction.find(params[:attraction_id])
    ride = Ride.create(user_id: user.id, attraction_id: attraction.id)

    if ride.valid?
      msg=ride.take_ride
      if msg.empty?
        redirect_to user_path(user), notice: "Thanks for riding the #{attraction.name}!"
      else
        
        redirect_to user_path(user), notice: msg
      end
    end
  end

  def edit
  end

  def update
  end
end
