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
    if user.email.blank?
      redirect_to edit_user_path(user), :alert => "Please enter your email address."
    else
      url = params[:request_path] ? params[:request_path] : root_url
      sign_in_and_redirect(:user, user)
      #redirect_to url, :notice => 'Signed in!'
    end
  end

  def failure
  	reset_session
    redirect_to "/", :notice => 'Signed out!'
  end

  def destroy
  	redirect_to "/", :alert => "Authentication error: #{params[:message].humanize}"
  end
end
