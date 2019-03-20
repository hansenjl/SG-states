class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
       t.integer :user_id
       t.integer :state_id
       t.integer :text
    end
  end
end
