class CreateRepos < ActiveRecord::Migration
  def change
    create_table :repos do |t|
      t.string :name, unique: true
      t.string :url
      t.integer :pull_requests_count
      t.integer :github_id, unique: true
      t.json :github_data
      t.timestamps null:false
    end
  end
end
