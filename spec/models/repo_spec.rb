require 'spec_helper'
require 'rails_helper'

describe 'Repo',type: :model do

  before(:all) do
    Repo.delete_all
    @repos = Repo.github_repos
  end

  it 'gets all the GA WDI public repos' do
    expect(@repos.length).to eq 4
  end

  it 'parses the number of pages of the response' do
    
  end

  it 'gets all the pages of repos' do
    
  end

  it 'saves all the repos in the database' do
    expect(Repo.all.length).to eq 358
  end
end