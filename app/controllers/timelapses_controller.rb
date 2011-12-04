class TimelapsesController < ApplicationController
  
  def show 
    @timestamp = Timestamp.find(params[:id])
    @links = @timestamp.links
    
    respond_to do |format|
      format.html
      format.json {
        render :json => @links
      }
    end
    
  end
  
end
