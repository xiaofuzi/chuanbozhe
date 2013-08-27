class CreateSchoolnews < ActiveRecord::Migration
  def change
    create_table :schoolnews do |t|
      t.string  :title
      t.string  :site
      t.string  :content
      t.integer :user_id

      t.timestamps
    end
    add_index :schoolnews, [:user_id, :created_at]
  end
end
