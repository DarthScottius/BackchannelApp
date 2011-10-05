class Reply < ActiveRecord::Base
  has_many :votes
  belongs_to :post
  
 
  def self.votenow postid
    r = Reply.find(postid)
    val = r.read_attribute(:numvotes)
    if val.nil?  
        val  = 1
    end
    r.update_attributes(:numvotes => val)
  end
end
