class PilotsController < ApplicationController


    layout 'form'

    include ApplicationHelper
    before_action :check_not_login


    def index
        @pilots = Pilot.where(creator: current_user.id).all
        @pilots = Array.new if @pilots.nil?
    end

    def new
        @new_pilot = Pilot.new
    end


    def create
        
        @new_pilot = Pilot.new(create_pilot_params)

        if @new_pilot.save
            redirect_to pilots_path
        else
            render :new, status: 422

        end
    end

    def show
        @pilot = Pilot.find(params[:id])
    end


    def destroy
        @pilot = Pilot.find(params[:id])

        if @pilot
            @pilot.destroy
        end

        redirect_to pilots_path

    end
    
    private 
        def create_pilot_params
            params.permit(:firstname, :lastname, :creator)
        end
end
