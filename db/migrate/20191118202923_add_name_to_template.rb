class AddNameToTemplate < ActiveRecord::Migration[5.1]
  def change
    add_column :templates, :name, :string
  end
end
