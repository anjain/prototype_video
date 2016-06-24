class AddFieldToUserProfile < ActiveRecord::Migration
  def change
  	add_column :user_profiles, :objective, :text
  	add_column :user_profiles, :skill_1_efficiency, :string
  	add_column :user_profiles, :skill_2_efficiency, :string
  	add_column :user_profiles, :skill_3_efficiency, :string
  	add_attachment :user_profiles, :image
  end
end
