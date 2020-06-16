class ToolsController < ApplicationController
    def index
      
    end

    def show
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
        params.require(:tool).permit(:name, :description, :condition, :price)
    end
end
