class ReposController < ApplicationController
  before_filter :get_repos, only: :index

  def index
    params["name"].nil? ? @repos = Repo.all.includes(:pull_requests) : @repos = Repo.where(name: params["name"]).includes(:pull_requests)
    render json: @repos, include: 'pull_requests', status: 200
  end

  def show
    @repo = Repo.find(params[:id])
    render json: @repo, status: 200
  end

  private
  def get_repos
    Repo.github_repos
  end

  def repo_params
    params.require(:repo).permit(:name, :urls, :github_data)
  end
end