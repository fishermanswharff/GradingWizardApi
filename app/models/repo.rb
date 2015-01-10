class Repo < ActiveRecord::Base
  validates :name, :url, presence: true
  has_many :pull_requests

  def self.github_repos
    Rails.cache.fetch([:ga_repos,self], expires_in: 5.minutes) do
      repos = {}
      repos[:pages] = []
      client = Octokit::Client.new(:access_token => ENV['GITHUB_TOKEN'])
      first_page = client.repos('ga-wdi-boston', :per_page => 100)
      repos[:pages] << first_page
      last_response = client.last_response
      number_of_pages = last_response.rels[:last].href.match(/page=(\d+)$/)[1].to_i
      loop do
        last_response = last_response.rels[:next].get
        repos[:pages] << last_response.data
        break if last_response.rels[:next].nil?
      end
      repos[:pages].map { |page|  
        page.map { |repo|
          if Repo.all.length > 0
            Repo.create!({name: repo[:name], url: repo[:html_url], github_data: repo.to_json}) if Repo.find_by(name: repo[:name]).nil? 
          else
            Repo.create!({name: repo[:name], url: repo[:html_url], github_data: repo.to_json})
          end
        }
      }
    end
  end
end