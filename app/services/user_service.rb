class UserService < BaseService

  # def self.find_or_create_user(email, name)
  #   response = local_connection.get('/api/v1/user')
  # end
  def self.create_user_call(auth_hash)
    response = local_connection.post('/api/v1/users'), {
      name: auth_hash['info']['email'],
      email: auth_hash['info']['name'],
      image: auth_hash['info']['image'],
      token: auth_hash['credentials']['token']
    }.to_json
  end


end