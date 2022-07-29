class UserFacade 

  def self.find_user(email, name)
    #User body to send email and name to backend, not params
    json = UserService.find_user_call(email, name)
    User.new(json)
  end

  def self.create_user(auth_hash)
    json = UserService.create_user_call(auth_hash)
    User.new(json)
  end

  def self.user_items(email)
    
  end

end