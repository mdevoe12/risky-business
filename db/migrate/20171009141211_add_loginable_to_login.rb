class AddLoginableToLogin < ActiveRecord::Migration[5.1]
  def change
    add_reference :logins, :loginable, polymorphic: true
  end
end
