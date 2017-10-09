require 'rails_helper'
require 'models/concerns/loginable_spec'

RSpec.describe Supervisor, type: :model do
  it_behaves_like 'loginable'
end
