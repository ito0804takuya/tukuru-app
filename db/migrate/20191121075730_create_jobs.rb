class CreateJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
      t.string :name, null: false
      t.string :body, null: false
      t.string :tel, null: false
      t.string :email, null: false
      t.string :url
      t.string :postal_code
      t.string :city, null: false
      t.string :block, null: false
      t.string :bulding, null: false
      t.integer :prefecture_id, null: false, foreign_key: true
      t.integer :image_id, null: false, foreign_key: true
      t.references :company, type: :bigint, null: false, foreign_key: true
      t.references :seeker, foreign_key: true
      t.timestamps
    end
  end
end
