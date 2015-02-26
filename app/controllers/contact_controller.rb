class ContactController < ApplicationController
  skip_before_filter :authenticate_user!

  def send_mail
    Contact.send_mail(params[:name], params[:company], params[:email]).deliver
  end
end
