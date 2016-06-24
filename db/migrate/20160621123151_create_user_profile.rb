class CreateUserProfile < ActiveRecord::Migration
  def change
    create_table :user_profiles do |t|
    	t.string :name
    	t.date :dob
    	t.string :location
    	t.string :current_job
    	t.string :skill_1
    	t.string :skill_2
    	t.string :skill_3
    	t.integer :user_id

    	t.timestamps
    end
  end
end
