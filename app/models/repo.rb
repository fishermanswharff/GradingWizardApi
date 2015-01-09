require 'pry'
class Repo < ActiveRecord::Base
  validates :name, :url, presence: true
  has_many :pull_requests

  def self.github_repos
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
        Repo.find_by(name: repo[:name]).nil? ? Repo.create!({name: repo[:name], url: repo[:html_url], github_id: repo[:id], github_data: repo.to_json}) : break
      }
    }
    # Rails.cache.fetch([:ga_repos,self], expires_in: 1.second) do
    # end
  end
end