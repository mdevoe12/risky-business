class Login < ApplicationRecord
  has_secure_password
  belongs_to :loginable, :polymorphic => true
end
