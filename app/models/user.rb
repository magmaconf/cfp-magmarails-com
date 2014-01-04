class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable

  include Cfp::User
  include Gravtastic

  delegate :company, :name, to: :profile, allow_nil: true
  delegate :email, to: :profile, prefix: true, allow_nil: true

  gravtastic :profile_email

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid      = auth['uid']
      user.email    = "#{user.uid}@github.com"
      user.nickname = auth['info']['nickname']
    end
  end

  def self.reviewers
    all.select { |u| u.roles.include?(:reviewer) }
  end
end
