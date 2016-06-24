class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  has_one :user_profile
  has_one :video
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  accepts_nested_attributes_for :user_profile
  accepts_nested_attributes_for :video
  scope :active_users, -> { where('confirmed_at IS NOT NULL') }

  def name
    if self.user_profile.present?
      user_profile.name
    end
  end

  def job
    if self.user_profile.present?
      user_profile.current_job
    else
      "No job mentioned"
    end
  end

  def image_url
    if self.user_profile.present?
      if self.user_profile.image.present?
        self.user_profile.image.url(:medium)
      else
        '/assets/noavatar.jpg'
      end
    else
      '/assets/noavatar.jpg'
    end
  end
end
