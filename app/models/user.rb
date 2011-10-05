class User < ActiveRecord::Base
  has_many :votes
  has_many :replies
  has_many :posts
  
   attr_accessible :user_email , :user_name, :user_password
  
   validates :user_name, :presence => true, :uniqueness => true
   validates :user_password, :confirmation => true
  
  def self.authenticate(name,password)
    if user = find_by_user_name(name)
      if user.user_password == password
        user
      end
    end
  end
  
end
