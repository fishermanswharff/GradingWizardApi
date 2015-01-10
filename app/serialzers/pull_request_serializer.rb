class PullRequestSerializer < ActiveModel::Serializer
  attributes :travis_identifier, :name, :build_status, :status_message, :build_url, :commit_message, :committer_name, :pull_request_number
  belongs_to :repo
end