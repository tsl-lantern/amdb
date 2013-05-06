class VotesController < ApplicationController

  before_filter :require_sign_in

  def require_sign_in
    if session[:user_id].blank?
      redirect_to :back, notice: "Must be signed in to vote."
    end
  end

  def index
    @votes = Vote.all
  end

  def show
    @vote = Vote.find_by_id(params[:id])
  end

  def new
    @vote = Vote.new
  end

  def create
    @vote = Vote.new
    @vote.user_id = params[:user_id]
    @vote.movie_id = params[:movie_id]

    if @vote.save
            redirect_to movies_url
          else
      render 'new'
    end
  end

  def edit
    @vote = Vote.find_by_id(params[:id])
    if @vote.user_id != session[:user_id]
      redirect_to :back, notice: "Nice try."
      return
    end
  end

  def update
    @vote = Vote.find_by_id(params[:id])
    if @vote.user_id != session[:user_id]
      redirect_to :back, notice: "Nice try."
      return
    end
    @vote.user_id = params[:user_id]
    @vote.movie_id = params[:movie_id]

    if @vote.save
            redirect_to votes_url
          else
      render 'edit'
    end
  end

  def destroy
    @vote = Vote.find_by_id(params[:id])
    if @vote.user_id != session[:user_id]
      redirect_to :back, notice: "Nice try."
      return
    end
    @vote.destroy
        redirect_to votes_url
      end
end
