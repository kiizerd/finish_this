class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :priority
      t.string :status
      t.references :section, null: false, foreign_key: true

      t.timestamps
    end
  end
end
