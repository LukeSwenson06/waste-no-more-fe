class UsersController < ApplicationController

  def show
    if active_session?
      @user = current_user
      @items = UserFacade.user_items(session[:email])
      if @items != []
        @recipes = RecipeFacade.find_recipes(@items)
      end
    else
      redirect_to '/'
      flash[:error] = "Please login to view your dashboard"
    end
  end

  def create
    auth_hash = request.env['omniauth.auth']
    session[:token] = auth_hash['credentials']['token']
    if auth_hash[:info][:email] == nil
      session[:email] = auth_hash[:info][:nickname]
    else
      session[:email] = auth_hash['info']['email']
    end
    UserFacade.create_user(auth_hash)
    redirect_to '/dashboard'
  end

  def destroy
    session.destroy
    redirect_to '/'
  end


end
