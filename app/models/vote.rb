class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  belongs_to :reply 
  
  def self.addvote  repid,  votetype
    type = votetype
    if ( votetype == 1.to_s )
      Post.votenow repid 
      return
    end  
    Reply.votenow repid
  end
  
  def self.test
    
  end

end
