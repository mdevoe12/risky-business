class Task < ApplicationRecord
  belongs_to :worker
  belongs_to :supervisor
end
