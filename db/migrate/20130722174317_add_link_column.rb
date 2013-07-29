class AddLinkColumn < ActiveRecord::Migration
  def change
  	add_column :jobs, :links, :string
  end
end
