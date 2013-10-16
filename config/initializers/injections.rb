#
# Like a Baws
#
Cfp::Profile.send :validates, :email, :presence => true

Cfp::Proposal.class_eval do
  def user_email
    user.profile.email
  end
end
