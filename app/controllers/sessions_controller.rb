class SessionsController < ApplicationController
  skip_filter :authenticate_user!

  def new
    redirect_to '/auth/github'
  end

  def create
    auth = request.env["omniauth.auth"]

    user = User.where(:provider => auth['provider'],
                      :uid => auth['uid'].to_s).first || User.create_with_omniauth(auth)
    session[:user_id] = user.id

    # Stored to be used in the profile#new page
    session[:user_name]  = auth["info"]["name"]
    session[:user_email] = auth["info"]["email"]

    if user && user.can_review?
      url = request_path_params || root_url
      sign_in_and_redirect(:user, user)
    end
  end

  def destroy
    reset_session
    redirect_to "/", :notice => 'Signed out!'
  end

  def failure
    redirect_to "/", :alert => "Authentication error: #{params[:message].humanize}"
  end

  private
  def request_path_params
    params[:request_path] && params.require(:request_path).permit(:provider, :uid, :email, :password, :password_confirmation, :remember_me, :roles)
  end
end
