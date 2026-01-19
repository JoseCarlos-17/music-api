# frozen_string_literal: true

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable

  include Rails.application.routes.url_helpers
  include DeviseTokenAuth::Concerns::User

  has_one_attached :profile_photo

  enum :role, { user:0, admin:1 }

  def profile_photo_url
    "#{ENV['BASE_URL']}#{rails_blob_path(self.profile_photo, only_path: true)}" if self.profile_photo.attached?
  end
end
