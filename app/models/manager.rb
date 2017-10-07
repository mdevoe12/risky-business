class Manager < ApplicationRecord
  belongs_to :site
  has_many :supervisors
end
