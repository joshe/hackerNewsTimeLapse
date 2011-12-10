class Link < ActiveRecord::Base
  
  belongs_to :timestamp
  
  def self.search(search)
    if search
      find(:all, :conditions => ['title LIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end
  
end
