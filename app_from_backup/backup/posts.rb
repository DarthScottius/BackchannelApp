class Posts < ActiveRecord::Base
  has_many :replies
  belongs_to :user
  
  def self.search(search)
    all(:conditions => ['post like ?',  "%#{search}%"] )
  end
end
