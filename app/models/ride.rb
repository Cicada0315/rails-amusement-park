class Ride < ApplicationRecord
    belongs_to :user
    belongs_to :attraction 

    def take_ride
        msg=""
        if user.tickets < attraction.tickets && user.height < attraction.min_height 
            msg= "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
        elsif user.tickets < attraction.tickets
            msg= "Sorry. You do not have enough tickets to ride the #{attraction.name}."
        elsif user.height < attraction.min_height 
            msg= "Sorry. You are not tall enough to ride the #{attraction.name}."  
        else
            updated_tickets=user.tickets-attraction.tickets
            updated_nausea=user.nausea+attraction.nausea_rating
            updated_happiness=user.happiness+attraction.happiness_rating
            user.update(tickets: updated_tickets, nausea: updated_nausea, happiness: updated_happiness)
            msg = "Thanks for riding the #{attraction.name}!"
        end
        msg
    end
end
