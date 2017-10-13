require 'rails_helper'

shared_examples 'loginable' do
  it { is_expected.to have_many(:logins)}
end
