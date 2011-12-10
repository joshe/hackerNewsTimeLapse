include ActionView::Helpers::DateHelper

class TimelapsesController < ApplicationController
  
  def show 
    @timestamp = Timestamp.find(params[:id])
    @last = Timestamp.last
    @links = @timestamp.links
    @start = params[:id]
    @currentTime = "#{@timestamp.created_at.strftime("%l:%M %p")} PST"
    #@currentTime = "#{distance_of_time_in_words_to_now(@timestamp.created_at)} ago, #{@timestamp.created_at.strftime("%l:%M %p")} PST"
    
    respond_to do |format|
      format.html
      format.json {
        #render :json => {:timestamp => "#{distance_of_time_in_words_to_now(@timestamp.created_at)} ago, #{@timestamp.created_at.strftime("%l:%M %p")} PST", :links => @links}
        render :json => {:timestamp => "#{@timestamp.created_at.strftime("%l:%M %p")} PST", :links => @links}
      }
    end
    
  end
  
  def now 
    @timestamp = Timestamp.last
    @last = @timestamp
    @links = @timestamp.links
    @start = @timestamp.id
    @currentTime = "#{@timestamp.created_at.strftime("%l:%M %p")} PST"
    #@currentTime = "#{distance_of_time_in_words_to_now(@timestamp.created_at)} ago, #{@timestamp.created_at.strftime("%l:%M %p")} PST"
    
    respond_to do |format|
      format.html
      format.json {
        render :json => {:timestamp => "#{@timestamp.created_at.strftime("%l:%M %p")} PST", :links => @links}
        #render :json => {:timestamp => "#{distance_of_time_in_words_to_now(@timestamp.created_at)} ago, #{@timestamp.created_at.strftime("%l:%M %p")} PST", :links => @links}
      }
    end
    
  end
  
end
