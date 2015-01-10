require 'byebug'
class PullRequestsController < ApplicationController

  def index
    @pull_requests = PullRequest.where(repo_id: params[:repo_id])
    render json: @pull_requests, status: 200
  end

  def create
  end

  def update
  end

  def destroy
  end

  private
  def pull_request_params
    params.require(:pull_request).permit(:travis_uuid,:name,:build_status,:status_message,:build_url,:commit_message,:pull_request_number,:committer_name,:repo_id)
  end

end