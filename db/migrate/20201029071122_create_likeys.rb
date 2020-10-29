class CreateLikeys < ActiveRecord::Migration[5.2]
  def change
    create_table :likeys do |t|
      t.belongs_to :user, index:true
      t.belongs_to :gossip, index:true
      t.timestamps
    end
  end
end
