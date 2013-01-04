#
# Like a Baws
#

Cfp::Profile.send :attr_accessible, :email
Cfp::Profile.send :validates, :email, :presence => true
