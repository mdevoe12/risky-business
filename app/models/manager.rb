class Manager < ApplicationRecord
  belongs_to :site
  has_many :supervisors
  has_many :logins, :as => :loginable

  # include Loginable
end
