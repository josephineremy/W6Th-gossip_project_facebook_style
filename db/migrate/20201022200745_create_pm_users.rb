class CreatePmUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :pm_users do |t|
      t.belongs_to :recipient, index: true
      t.belongs_to :private_message, index: true
      t.timestamps
    end
  end
end
