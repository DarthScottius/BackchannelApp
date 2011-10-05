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
    #@replies = Reply.all
    #r = @replies.find( :conditions => {:id => repid})
    #v = r.read_attribute(:numvotes)
    #v = r.numvotes
    #r.write_attribute(:numvotes, v+1)
  end
end
