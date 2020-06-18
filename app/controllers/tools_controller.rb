class ToolsController < ApplicationController
    def index
        @tools = Tool.all
        @tools_map = @tools.geocoded

        @markers = @tools_map.map do |tool|
          {
            lat: tool.latitude,
            lng: tool.longitude,
            infoWindow: render_to_string(partial: "info_windows", locals: { tool: tool })
          }
        end 
    end

    def show
        @tool = Tool.find(params[:id])
    end

    def new
        @tool = Tool.new
    end
    
    def create
        @tool = Tool.new(tool_params)
        @tool.user = current_user
        @tool.save
    
        redirect_to tools_path(@tool)
    end

    private
    
    def tool_params
        params.require(:tool).permit(:name, :description, :condition, :price, :address)
    end
end
