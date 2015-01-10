class PullRequestsController < ApplicationController

  def index
  end

  def create
  end

  def update
  end

  def destroy
  end

  private
  def pull_request_params
    params.require(:pull_request).permit()
  end

end