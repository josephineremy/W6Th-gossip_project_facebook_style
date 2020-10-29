class PrivateMessage < ApplicationRecord
  belongs_to :sender, class_name: "User"
  has_many :pm_users
  has_many :recipients, through: :pm_users, class_name: "User"
end
