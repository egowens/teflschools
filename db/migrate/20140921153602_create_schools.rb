class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :name
      t.string :website
      t.string :address
      t.string :contact
      t.string :email

      t.timestamps
    end
  end
end
