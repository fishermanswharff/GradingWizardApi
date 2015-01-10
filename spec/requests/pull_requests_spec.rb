require 'spec_helper'
require 'rails_helper'

describe 'Pull Requests Api endpoint' do

  before(:all) do
    Repo.delete_all
    PullRequest.delete_all
    @repo = Repo.create!({name: "wdi_1_ruby_demo_basics", url: "https://github.com/ga-wdi-boston/wdi_1_ruby_demo_basics"})
    @pull_request = PullRequest.create!({repo_id: @repo.id, committer_name: "fishermanswharff", travis_identifier: 46232633, name: "ga-wdi-boston/wdi_1_ruby_demo_basics", build_status: 0, status_message: "success", build_url: "http://travis-ci.org", commit_message: "yo, this is my commit message bitches", pull_request_number: 1})
  end

  describe '#index' do
    it 'get''s all the pull_requests from a single repo' do
      get "/repos/#{@repo.id}/pull_requests"
      expect(response.status).to eq 200
      prs = JSON.parse(response.body)
      expect(prs.length).to eq 1
      expect(prs.first["repo_id"]).to eq @repo.id
    end
  end

  describe '#create' do
  end
end