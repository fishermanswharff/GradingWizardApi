class ReposController < ApplicationController

  def index
    @repos = Repo.all
    render json: @repos, status: 200
  end
end