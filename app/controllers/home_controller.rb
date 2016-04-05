class HomeController < ApplicationController
	def index
		@venues = Venue.all
		@events = Event.all
		@orders = Order.all

	end
end
