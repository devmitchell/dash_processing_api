class EventsController < ApplicationController
  def create
    event = Event.new event_params

    if event.valid?
      # TODO: Notify here
      render status: 201
    else
      render status: 422, json: { errors: event.errors }
    end
  end

  private

  def event_params
    params.require(:event).permit(:event_type, :button_mac_address)
  end
end
