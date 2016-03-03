class AddActiveToPoll < ActiveRecord::Migration
  def change
    add_column :polls, :active, :boolean, default: false
  end
end
