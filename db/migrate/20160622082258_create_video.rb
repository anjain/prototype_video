class CreateVideo < ActiveRecord::Migration
  def change
    create_table :videos do |t|
    	t.string :uuid
    	t.string :url
    	t.integer :user_id

    	t.timestamps
    end
  end
end
