class CreateJobSeekers < ActiveRecord::Migration[5.2]
  def change
    create_table :job_seekers do |t|
      t.references :job, null: false, foreign_key: true
      t.references :seeker, null: false, foreign_key: true
      t.timestamps
    end
  end
end
