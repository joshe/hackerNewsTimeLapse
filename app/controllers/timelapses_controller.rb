include ActionView::Helpers::DateHelper

class TimelapsesController < ApplicationController
  
  def show 
    @timestamp = Timestamp.find(params[:id])
    @allTimestamps = Timestamp.find(:all, :order => "id desc", :limit => 100)
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
    @allTimestamps = Timestamp.find(:all, :order => "id desc", :limit => 100)
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
