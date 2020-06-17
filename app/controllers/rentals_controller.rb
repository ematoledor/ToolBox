class RentalsController < ApplicationController

    def new
        @rental = Rental.new
        @tool = Tool.find(params[:tool_id])
    end

    def create
        @tool = Tool.find(params[:tool_id])
        @rental = Rental.new(rental_params)
        @rental.tool = @tool
        @rental.user = current_user
        
        if @rental.save
          redirect_to tools_path
          flash[:alert] = "Congrats! The tool is now available on your toolbox."
    
        else
          render :new
        end
    end

    def destroy
        @rental = Rental.find(params[:id])
        @rental.destroy
        redirect_to tool_path(@rental.tool)
    end

    def rental_params
        params.require(:rental).permit(:start_date, :end_date)
    end

end
