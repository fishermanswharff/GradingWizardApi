class PullRequest < ActiveRecord::Base
  belongs_to :repo, dependent: :destroy, counter_cache: true
end