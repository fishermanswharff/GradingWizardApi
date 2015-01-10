class RepoSerializer < ActiveModel::Serializer
  attributes :id, :name , :url, :pull_requests_count
  has_many :pull_requests
end