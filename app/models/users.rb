class Users < ActiveRecord::Base

 has_many :votes
  has_many :replies
  has_many :posts
  
  #validates :username, :presence => true, :uniqueness => true
  #validates :password, :confirmation => true
  
    def self.authenticate(name,password)
    if user = User.find(:conditions => {:user_email => name})
      if user && user.password == password
        user
      end
    end
  end
end
