class UserProfile < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :name, :current_job, :location
  validate :skills
  validates_length_of :objective, maximum: 140, allow_blank: true
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/assets/noavatar.jpg"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/, if: :image?

  def skills
    if skill_1.empty? && skill_2.empty? && skill_3.empty?
      errors.add(:base, "Add at least one skill")
    end
  end

  def get_effciency_value(key)
    if key == '1'
      'Beginner'
    elsif key == '2'
      'Average'
    elsif key == '3'
      'Expert'
    end
  end

  def get_slider_value(key)
    field = self.send("skill_#{key}_efficiency")
    if field == 'Beginner'
      '1'
    elsif field == 'Average'
      '2'
    elsif field == 'Expert'
      '3'
    else
      '2'
    end
  end

  def get_skills
    [skill_1, skill_2, skill_3].compact.split("").flatten.join(", ")
  end
end