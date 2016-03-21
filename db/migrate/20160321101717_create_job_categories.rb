class CreateJobCategories < ActiveRecord::Migration
  def change
    create_table :job_categories do |t|
      t.references :category, index: true, foreign_key: true
      t.references :job, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
