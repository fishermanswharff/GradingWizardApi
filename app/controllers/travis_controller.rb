require 'byebug'

class TravisController < ApplicationController
  skip_before_filter  :verify_authenticity_token
  
  def nomnom
    if not valid_request?
      puts "Invalid payload request for repository #{repo_slug}"
    else
      payload = JSON.parse(params[:payload])
      url = "https://github.com/" + repo_slug
      if payload['type'] == 'pull_request'
        # PullRequest.create!({committer_name: payload['committer_name'], unique_id: payload['id'], name: env['HTTP_TRAVIS_REPO_SLUG'], build_status: payload['status'], status_message: payload['status_message'], build_url: payload['build_url'], commit_message: payload['message'], pull_request_number: payload['pull_request_number']})
      end
    end
    render nothing: true
  end

  private
  def valid_request?
    digest = Digest::SHA2.new.update("#{env['HTTP_TRAVIS_REPO_SLUG']}#{ENV['TRAVIS_CI_TOKEN']}")
    digest.to_s == authorization
  end

  def authorization
    env['HTTP_AUTHORIZATION']
  end

  def repo_slug
    env['HTTP_TRAVIS_REPO_SLUG']
  end
end