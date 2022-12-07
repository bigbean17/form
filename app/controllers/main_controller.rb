class MainController < ApplicationController
    layout 'home'
    include ApplicationHelper
    before_action :check_not_login

    def index
        @pilots = Pilot.all
        @drones = Drone.all
    end
end
