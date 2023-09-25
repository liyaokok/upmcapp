class ReservationSearchesController < ApplicationController
    def new
        location_id = params[:location_id]

        selected_year = params["selected_date(1i)"]
        selected_month = params["selected_date(2i)"];
        selected_day = params["selected_date(3i)"];

        @selected_date_time = DateTime.new(selected_year.to_i, selected_month.to_i, selected_day.to_i)
        
        @available_reservations = 
            Reservation.joins(:technician).
            where(reservation_customer:nil, start_at: @selected_date_time..(@selected_date_time + 1.day)).
            where(technician: {location_id: location_id})

        @technicians = Technician.where(location_id: location_id)
    end
end