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
    items = json[:data].map do |item_data|
      Item.new(item_data[:attributes])
    end
    if items != []
      items_categorized = {expired: [], expiring: [], fresh: []}
      items.each do |item|
        if item.days_to_expired(Date.today) <= 0
          items_categorized[:expired] << item
        elsif 0 < item.days_to_expired(Date.today) && item.days_to_expired(Date.today) <= 2
          items_categorized[:expiring] << item
        else
          items_categorized[:fresh] << item
        end
      end
      return items_categorized
    else
      return items
    end
  end

end
