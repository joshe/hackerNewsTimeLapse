include ActionView::Helpers::DateHelper

class TimelapsesController < ApplicationController
  
  def show 
    @timestamp = Timestamp.find(params[:id])
    @last = Timestamp.last
    @links = @timestamp.links
    @start = params[:id]
    
    respond_to do |format|
      format.html
      format.json {
        render :json => {:timestamp => "#{distance_of_time_in_words_to_now(@timestamp.created_at)} ago", :links => @links}
      }
    end
    
  end
  
  def now 
    @timestamp = Timestamp.last
    @last = @timestamp
    @links = @timestamp.links
    @start = @timestamp.id
    
    respond_to do |format|
      format.html
      format.json {
        render :json => {:timestamp => "#{distance_of_time_in_words_to_now(@timestamp.created_at)} ago", :links => @links}
      }
    end
    
  end
  
end
