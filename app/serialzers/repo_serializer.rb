class RepoSerializer < ActiveModel::Serializer
  attributes :id, :name , :url, :pull_requests_count, :ssh_url
  has_many :pull_requests

  def ssh_url
    hash = object.github_data.to_h
    hash["ssh_url"]
  end
end