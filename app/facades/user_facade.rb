class UserFacade

  def self.find_user(email)
    json = UserService.find_user_call(email)
    User.new(json[:data][:attributes])
  end

  def self.create_user(auth_hash)
    UserService.create_user_call(auth_hash)
  end

  def self.user_items(email)
    json = UserService.get_user_items(email)
    if json[:data]
      items = json[:data].map do |item_data|
        Item.new(item_data[:attributes])
      end
    else
      items = nil
    end
    return items
  end

end
