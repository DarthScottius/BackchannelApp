class Post < ActiveRecord::Base
 
  has_many :replies
  belongs_to :user
  
  def self.search(search)
    @searchreplies = Reply.all(:conditions => ['replytext like ?',  "%#{search}%"] )
    all(:conditions => ['title like ?',  "%#{search}%"] )
  end
  
   def self.votenow postid 
    r = Post.find(postid)
    val = r.read_attribute(:weight)
    if( val.nil? )
      val = 0;
    end
    val  = val +1;
    r.update_attributes(:weight => val)
  end
end
