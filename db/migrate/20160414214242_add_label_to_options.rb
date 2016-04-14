class AddLabelToOptions < ActiveRecord::Migration
  def change
    add_column :options, :label, :string
    add_column :options, :ord, :integer, default: 0
  end
end
