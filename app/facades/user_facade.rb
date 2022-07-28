class UserFacade 

  def self.find_user(email, name)
    json = UserService.find_user_call(email, name)
    User.new(json)
  end

  def self.user_items(email)
    
  end

end