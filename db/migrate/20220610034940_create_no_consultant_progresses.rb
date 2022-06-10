class CreateNoConsultantProgresses < ActiveRecord::Migration
  def change
    create_table :no_consultant_progresses do |t|
      t.string :name
      t.float :rate

      t.timestamps null: false
    end
  end
end
