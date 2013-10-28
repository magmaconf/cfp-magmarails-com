require_dependency Cfp::Engine.root.join('app', 'controllers', 'cfp', 'profiles_controller').to_s

Cfp::ProfilesController.class_eval do
  def create
    @profile = Cfp::Profile.new profile_params
    if @profile.save
      current_user.profile = @profile
      current_user.save
      redirect_to '/'
    else
      render :action => :new
    end
  end

  def update
    if @profile.update_attributes profile_params
      redirect_to '/', :notice => t('profile.edited.success')
    else
      render :action => :edit
    end
  end

  private
  def profile_params
    params.require(:profile).permit(:name, :title, :company, :locale, :bio, :email)
  end
end
