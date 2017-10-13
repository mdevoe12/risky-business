require 'rails_helper'
require 'models/concerns/loginable_spec'

RSpec.describe Manager, type: :model do
  it_behaves_like 'loginable'
end
