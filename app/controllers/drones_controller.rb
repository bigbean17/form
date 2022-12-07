class DronesController < ApplicationController

    layout 'form'
    include ApplicationHelper
    before_action :check_not_login


    def index
        @my_drones = Drone.where(creator: current_user.id).all
        @my_drones = Array.new if @my_drones.nil?
      
        
    end

    def new
        @drone = Drone.new
    end



    def show
        puts params
        @drone = DroneInfo.find_by(id: params[:id])
        render layout: false
    end 

    
    def create
        
        @drone = Drone.new(create_drone_params)
        
        if @drone.save
            redirect_to my_drones_path
        else
            render :new, status: 422
        end
        

    end 


    def destroy
        @drone = Drone.find(params[:id])

        if @drone
            @drone.destroy
        end

        redirect_to my_drones_path
    end


    
    def model
        
        @target = params[:target]
        @brand = params[:brand]
        @drone = Drone.new
        @SN = params[:SN]

        @model = []


        models = DroneInfo.where(:brand => @brand).all
        models.each{
            |n|
            model_arr= []
            model_arr.append(n.mname)
            model_arr.append(n.mname)
            @model.append(model_arr)
        }

       

        render layout: false



    end


    private
        def create_drone_params
            params.require(:drone).permit(:SN, :brand, :model, :creator)
        end


        def view_drone_params
            params.require(:drone).permit(:mname)
        end
end
