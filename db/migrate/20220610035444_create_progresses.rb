class CreateProgresses < ActiveRecord::Migration
  def change
    create_table :progresses do |t|
      t.string :name
      t.float :rate

      t.timestamps null: false
    end
  end
end
