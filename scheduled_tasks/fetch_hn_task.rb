require 'open-uri'
require 'nokogiri'

class FetchHnTask < Scheduler::SchedulerTask
  environments :all
  # environments :staging, :production
  
  every '15m', :first_at => Chronic.parse("10 pm")
  # other examples:
  # every '24h', :first_at => Chronic.parse('next midnight')
  # cron '* 4 * * *'  # cron style
  # in '30s'          # run once, 30 seconds from scheduler start/restart
  
  
  def run
    # Your code here, eg: 
    # User.send_due_invoices!
    url = "http://news.ycombinator.com/rss"
    doc = Nokogiri::XML(open(url))
    rank = 1
    
    t = Timestamp.create
    doc.css('item').each do |item|
      title = item.at_css("title").text
      href = item.at_css("link").text
      comments = item.at_css("comments").text
      
      l = Link.create(:rank => rank, :title => title, :href => href, :comments => comments, :timestamp_id => t.id)

      rank += 1
    end
    
    
    # use log() for writing to scheduler daemon log
    log("Added timestamp")
    log(Time.now)
  end
end