require 'spec_helper'
require 'rails_helper'
require File.join(Rails.root, "lib/modules/URLStripper.rb")

describe 'URLStripper' do

  before(:each) do
    Repo.delete_all
    Repo.create({
      name:"algorithms",
      url:"https://github.com/ga-wdi-boston/algorithms",
      github_data:
        [["id", 28308500],
         ["name", "algorithms"],
         ["full_name", "ga-wdi-boston/algorithms"],
         ["owner",
          [["login", "ga-wdi-boston"],
           ["id", 6361298],
           ["avatar_url", "https://avatars.githubusercontent.com/u/6361298?v=3"],
           ["gravatar_id", ""],
           ["url", "https://api.github.com/users/ga-wdi-boston"],
           ["html_url", "https://github.com/ga-wdi-boston"],
           ["followers_url", "https://api.github.com/users/ga-wdi-boston/followers"],
           ["following_url", "https://api.github.com/users/ga-wdi-boston/following{/other_user}"],
           ["gists_url", "https://api.github.com/users/ga-wdi-boston/gists{/gist_id}"],
           ["starred_url", "https://api.github.com/users/ga-wdi-boston/starred{/owner}{/repo}"],
           ["subscriptions_url", "https://api.github.com/users/ga-wdi-boston/subscriptions"],
           ["organizations_url", "https://api.github.com/users/ga-wdi-boston/orgs"],
           ["repos_url", "https://api.github.com/users/ga-wdi-boston/repos"],
           ["events_url", "https://api.github.com/users/ga-wdi-boston/events{/privacy}"],
           ["received_events_url", "https://api.github.com/users/ga-wdi-boston/received_events"],
           ["type", "Organization"],
           ["site_admin", false]]],
         ["private", false],
         ["html_url", "https://github.com/ga-wdi-boston/algorithms"],
         ["description", "algorithms playground for common questions"],
         ["fork", true],
         ["url", "https://api.github.com/repos/ga-wdi-boston/algorithms"],
         ["forks_url", "https://api.github.com/repos/ga-wdi-boston/algorithms/forks"],
         ["keys_url", "https://api.github.com/repos/ga-wdi-boston/algorithms/keys{/key_id}"],
         ["collaborators_url", "https://api.github.com/repos/ga-wdi-boston/algorithms/collaborators{/collaborator}"],
         ["teams_url", "https://api.github.com/repos/ga-wdi-boston/algorithms/teams"],
         ["hooks_url", "https://api.github.com/repos/ga-wdi-boston/algorithms/hooks"],
         ["issue_events_url", "https://api.github.com/repos/ga-wdi-boston/algorithms/issues/events{/number}"],
         ["events_url", "https://api.github.com/repos/ga-wdi-boston/algorithms/events"],
         ["assignees_url", "https://api.github.com/repos/ga-wdi-boston/algorithms/assignees{/user}"],
         ["branches_url", "https://api.github.com/repos/ga-wdi-boston/algorithms/branches{/branch}"],
         ["tags_url", "https://api.github.com/repos/ga-wdi-boston/algorithms/tags"],
         ["blobs_url", "https://api.github.com/repos/ga-wdi-boston/algorithms/git/blobs{/sha}"],
         ["git_tags_url", "https://api.github.com/repos/ga-wdi-boston/algorithms/git/tags{/sha}"],
         ["git_refs_url", "https://api.github.com/repos/ga-wdi-boston/algorithms/git/refs{/sha}"],
         ["trees_url", "https://api.github.com/repos/ga-wdi-boston/algorithms/git/trees{/sha}"],
         ["statuses_url", "https://api.github.com/repos/ga-wdi-boston/algorithms/statuses/{sha}"],
         ["languages_url", "https://api.github.com/repos/ga-wdi-boston/algorithms/languages"],
         ["stargazers_url", "https://api.github.com/repos/ga-wdi-boston/algorithms/stargazers"],
         ["contributors_url", "https://api.github.com/repos/ga-wdi-boston/algorithms/contributors"],
         ["subscribers_url", "https://api.github.com/repos/ga-wdi-boston/algorithms/subscribers"],
         ["subscription_url", "https://api.github.com/repos/ga-wdi-boston/algorithms/subscription"],
         ["commits_url", "https://api.github.com/repos/ga-wdi-boston/algorithms/commits{/sha}"],
         ["git_commits_url", "https://api.github.com/repos/ga-wdi-boston/algorithms/git/commits{/sha}"],
         ["comments_url", "https://api.github.com/repos/ga-wdi-boston/algorithms/comments{/number}"],
         ["issue_comment_url", "https://api.github.com/repos/ga-wdi-boston/algorithms/issues/comments/{number}"],
         ["contents_url", "https://api.github.com/repos/ga-wdi-boston/algorithms/contents/{+path}"],
         ["compare_url", "https://api.github.com/repos/ga-wdi-boston/algorithms/compare/{base}...{head}"],
         ["merges_url", "https://api.github.com/repos/ga-wdi-boston/algorithms/merges"],
         ["archive_url", "https://api.github.com/repos/ga-wdi-boston/algorithms/{archive_format}{/ref}"],
         ["downloads_url", "https://api.github.com/repos/ga-wdi-boston/algorithms/downloads"],
         ["issues_url", "https://api.github.com/repos/ga-wdi-boston/algorithms/issues{/number}"],
         ["pulls_url", "https://api.github.com/repos/ga-wdi-boston/algorithms/pulls{/number}"],
         ["milestones_url", "https://api.github.com/repos/ga-wdi-boston/algorithms/milestones{/number}"],
         ["notifications_url", "https://api.github.com/repos/ga-wdi-boston/algorithms/notifications{?since,all,participating}"],
         ["labels_url", "https://api.github.com/repos/ga-wdi-boston/algorithms/labels{/name}"],
         ["releases_url", "https://api.github.com/repos/ga-wdi-boston/algorithms/releases{/id}"],
         ["created_at", "2014-12-21T18:24:20.000Z"],
         ["updated_at", "2014-12-21T18:24:20.000Z"],
         ["pushed_at", "2014-12-09T22:29:08.000Z"],
         ["git_url", "git://github.com/ga-wdi-boston/algorithms.git"],
         ["ssh_url", "git@github.com:ga-wdi-boston/algorithms.git"],
         ["clone_url", "https://github.com/ga-wdi-boston/algorithms.git"],
         ["svn_url", "https://github.com/ga-wdi-boston/algorithms"],
         ["homepage", nil],
         ["size", 352],
         ["stargazers_count", 0],
         ["watchers_count", 0],
         ["language", "Ruby"],
         ["has_issues", false],
         ["has_downloads", true],
         ["has_wiki", true],
         ["has_pages", false],
         ["forks_count", 0],
         ["mirror_url", nil],
         ["open_issues_count", 0],
         ["forks", 0],
         ["open_issues", 0],
         ["watchers", 0],
         ["default_branch", "master"],
         ["permissions", [["admin", true], ["push", true], ["pull", true]]]]
        })
  end
  describe 'URLStripper::WDI' do
    it 'gets all of the repos in json format' do
      expect(URLStripper::WDI::get_json[0].class).to eq Hash
      expect(URLStripper::WDI::get_json[0]["name"]).to eq "algorithms"
      expect(URLStripper::WDI::get_json[0]["url"]).to eq "https://github.com/ga-wdi-boston/algorithms"
    end
    it 'strips out the ssh_urls' do
      json = URLStripper::WDI::get_json
      expect(URLStripper::WDI::get_ssh_urls(json)[0]).to eq "git@github.com:ga-wdi-boston/algorithms.git"
    end
  end
end