require 'spec_helper'
require 'rails_helper'

describe 'Travis Controller' do

  before(:all) do
    Repo.delete_all
    PullRequest.delete_all
    
    @repo = Repo.create({name: "wdi_1_ruby_demo_basics", url: "https://github.com/ga-wdi-boston/wdi_1_ruby_demo_basics"})
  end

  describe 'nomnom' do
    it 'receives a post from the travis webhook and creates a new PullRequest instance' do
      post '/travisreports',
      {
        payload: {
          "id"=>46232633, 
          "repository"=>
            {
              "id"=>2228655, 
              "name"=>"wdi_1_ruby_demo_basics", 
              "owner_name"=>"ga-wdi-boston", 
              "url"=>nil
            }, 
          "number"=>"20", 
          "config"=>
            {
              "language"=>"ruby", 
              "rvm"=>["2.2.0"], 
              "script"=>"bundle exec rspec spec", 
              "notifications"=>{"webhooks"=>"http://4d126c4b.ngrok.com/travisreports"}, 
              ".result"=>"configured", 
              "os"=>"linux"
            }, 
          "status"=>1, 
          "result"=>1, 
          "status_message"=>"Broken", 
          "result_message"=>"Broken", 
          "started_at"=>"2015-01-07T19:37:30Z", 
          "finished_at"=>"2015-01-07T19:37:43Z", 
          "duration"=>13, 
          "build_url"=>"https://travis-ci.org/ga-wdi-boston/wdi_1_ruby_demo_basics/builds/46232633", 
          "commit"=>"a86c98d745c396a9d314d6491931a62fc290c5f3", 
          "branch"=>"master", 
          "message"=>"gitignore", 
          "compare_url"=>"https://github.com/ga-wdi-boston/wdi_1_ruby_demo_basics/pull/1", 
          "committed_at"=>"2015-01-07T19:35:40Z", 
          "author_name"=>"fishermanswharff", 
          "author_email"=>"fishermanswharff@github.com", 
          "committer_name"=>"fishermanswharff", 
          "committer_email"=>"fishermanswharff@github.com", 
          "matrix"=>
            [
              {
                "id"=>46232634, 
                "repository_id"=>2228655, 
                "parent_id"=>46232633, 
                "number"=>"20.1", 
                "state"=>"finished", 
                "config"=>
                  {
                    "language"=>"ruby", 
                    "rvm"=>"2.2.0", 
                    "script"=>"bundle exec rspec spec", 
                    "notifications"=>
                      {"webhooks"=>"http://4d126c4b.ngrok.com/travisreports"}, 
                    ".result"=>"configured", 
                    "os"=>"linux"
                  }, 
                "status"=>1, 
                "result"=>1, 
                "commit"=>"a86c98d745c396a9d314d6491931a62fc290c5f3", 
                "branch"=>"master", 
                "message"=>"gitignore", 
                "compare_url"=>"https://github.com/ga-wdi-boston/wdi_1_ruby_demo_basics/pull/1", 
                "committed_at"=>"2015-01-07T19:35:40Z", 
                "author_name"=>"fishermanswharff", 
                "author_email"=>"fishermanswharff@github.com", 
                "committer_name"=>"fishermanswharff", 
                "committer_email"=>"fishermanswharff@github.com", 
                "finished_at"=>"2015-01-07T19:37:43Z"
              }
            ], 
          "type"=>"pull_request", 
          "pull_request_number"=>1
        }.to_json
      },
      { "HTTP_TRAVIS_REPO_SLUG" => "ga-wdi-boston/wdi_1_ruby_demo_basics","HTTP_AUTHORIZATION" => "955cfd9f992d2725c1f6f81f8446b529f688792bd2b874ca2a38802fde4126d1" }
      expect(response.status).to eq 201
      payload = JSON.parse(response.body)
      expect(payload["id"]).to eq 46232633
      expect(payload["parent"]["name"]).to eq "wdi_1_ruby_demo_basics"
      expect(PullRequest.where(travis_uuid: payload["id"])).to_not eq []
    end
  end
end