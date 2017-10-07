class Category < ApplicationRecord
  has_many :flras
  has_many :controls
  has_many :top_risks
end
