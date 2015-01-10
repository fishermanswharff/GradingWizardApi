require 'spec_helper'
require 'rails_helper'

describe 'Repo Api endpoint' do

  describe '#index' do
    it 'gets all the repos' do
      get '/repos'
      expect(response.status).to eq 200
      repos = JSON.parse(response.body)
      expect(repos.length).to eq 358
    end

    it 'gets the repos by parameters' do
      get '/repos?name=wdi_1_ruby_demo_basics'
      expect(response.status).to eq 200
      repo = JSON.parse(response.body)
      expect(repo.length).to eq 1
    end
  end
end