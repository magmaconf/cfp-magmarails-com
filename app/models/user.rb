# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  created_at             :datetime
#  updated_at             :datetime
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  roles                  :text
#  provider               :string
#  uid                    :string
#  nickname               :string
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable

  include Cfp::User
  include Gravtastic

  delegate :email, :company, :name, to: :profile, allow_nil: true, prefix: true

  gravtastic :profile_email

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid      = auth['uid']
      user.email    = auth['info']['email']
      user.nickname = auth['info']['nickname']
    end
  end

  def self.reviewers
    all.select { |u| u.roles.include?(:reviewer) }
  end

  def is_organizer?
    roles.include?(:organizer)
  end

  def make_organizer
    roles << :organizer
    save
  end
end
