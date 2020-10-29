class User < ApplicationRecord

  has_secure_password

  validates :password, presence: true, length: { minimum: 6 }, allow_blank: true
  validates :email, presence: true
  validates :first_name, presence: true, allow_nil: true


  belongs_to :city
  has_many :gossips
  has_many :sent_messages, foreign_key: 'sender_id', class_name: "PrivateMessage"
  has_many :pm_users
  has_many :received_messages, through: :pm_users, class_name: "PrivateMessage"
  has_many :comments
  has_many :likes

end
