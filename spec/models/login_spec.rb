require 'rails_helper'

RSpec.describe Login, type: :model do
  it { is_expected.to have_db_column(:loginable_id).of_type(:integer) }
  it { is_expected.to have_db_column(:loginable_type).of_type(:string) }

  it { is_expected.to belong_to(:loginable) }
end
