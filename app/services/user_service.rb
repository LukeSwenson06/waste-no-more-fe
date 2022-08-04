class UserService < BaseService

  def self.create_user_call(auth_hash)
    response = local_connection.post('/api/v1/users', "Content-Type" => "application/json") do |req|
      if auth_hash[:info][:email] == nil
          req.body = {
          name: auth_hash[:info][:name],
          email: auth_hash[:info][:nickname]
        }
      else      
          req.body = {
          name: auth_hash[:info][:name],
          email: auth_hash[:info][:email]
        }
      end
    end
  end

  def self.find_user_call(email)
    response = local_connection.get('/api/v1/users') do |req|
      req.body = {
       email: email
     }
    end
    json = JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_user_items(email)
    response = local_connection.get('/api/v1/users/items') do |req|
      req.body = {
        email: email
      }
    end
    json = JSON.parse(response.body, symbolize_names: true)
  end


end