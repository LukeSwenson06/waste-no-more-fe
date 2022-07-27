class SessionsController < ApplicationController

  def create
    email = request.env['omniauth.auth']['info']['email']
    name = request.env['omniauth.auth']['info']['name']
    user = Userfacade.find_user(email, name)
    redirect_to '/dashboard'
  end

end