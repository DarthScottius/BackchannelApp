class Reply < ActiveRecord::Base
  has_many :votes
  belongs_to :post
  belongs_to :user
  
 
  def self.votenow postid
    r = Reply.find(postid)
    val = r.read_attribute(:numvotes)
    val  = val +1;
    r.update_attributes(:numvotes => val)
  end
end
