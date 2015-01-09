class CreateRepos < ActiveRecord::Migration
  def change
    create_table :repos do |t|
      t.string :name, unique: true
      t.string :url, unique: true
      t.integer :pull_requests_count
      t.integer :github_id, unique: true
      t.json :github_data, unique: true
      t.timestamps null:false
    end
  end
end
