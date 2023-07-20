class AddUserToArticle < ActiveRecord::Migration[7.0]
  def change
   # add_column :articles, :user , :interger
    #add_index :articles, :user_id
    
    add_belongs_to :articles, :user , index: true 
  end
end
