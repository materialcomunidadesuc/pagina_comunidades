class CreateTemplates < ActiveRecord::Migration[5.1]
  def change
    create_table :templates do |t|
      t.text :structure
      t.text :initial_prayer
      t.text :motivation
      t.text :gospel
      t.text :activities
      t.text :purpose
      t.text :final_prayer
      t.text :annexed
      t.text :calendar
      t.integer :initial_year
      t.integer :initial_month
      t.integer :initial_day
      t.integer :final_year
      t.integer :final_month
      t.integer :final_day
      t.string :monday_gospel
      t.string :monday_saints
      t.string :tuesday_gospel
      t.string :tuesday_saints
      t.string :wednesday_gospel
      t.string :wednesday_saints
      t.string :thursday_gospel
      t.string :thursday_saints
      t.string :friday_gospel
      t.string :friday_saints
      t.string :saturday_gospel
      t.string :saturday_saints
      t.string :sunday_gospel
      t.string :sunday_saints

      t.timestamps
    end
  end
end
