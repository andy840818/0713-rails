class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      # id
      t.string :title
      t.text :content

      t.timestamps
      # datetime :create_at
      # datetime :update_at
    end
  end
end
