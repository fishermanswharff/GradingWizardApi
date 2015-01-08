class CreateRepos < ActiveRecord::Migration
  def change
    create_table :repos do |t|
      t.string :name
      t.string :url
      t.timestamps null:false
    end
  end
end
