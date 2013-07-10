class Jobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.text :title, :description
      t.string :location, :department  
    end
  end
end
