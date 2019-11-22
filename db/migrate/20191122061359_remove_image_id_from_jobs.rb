class RemoveImageIdFromJobs < ActiveRecord::Migration[5.2]
  def change
    remove_column :jobs, :image_id, :integer
  end
end
