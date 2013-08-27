class AddRankToArticles < ActiveRecord::Migration
  def change
  	add_column :articles, :rank, :integer, :null => false, :default => 0
  end
end
