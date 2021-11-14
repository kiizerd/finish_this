class CreateSections < ActiveRecord::Migration[6.1]
  def change
    create_table :sections do |t|
      t.string :name
      t.text :description
      t.string :priority
      t.string :status
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
