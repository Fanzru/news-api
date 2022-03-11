class NewsController < ApplicationController
  before_action :set_news, only: %i[ show edit update destroy ]

  # GET /news or /news.json
  def index
    @news = News.all
    render json: {
      "code": 200,
      "status": true,
      "message": "get all data successfully",
      "value": @news,
    }
  end

  # GET /news/1 or /news/1.json
  def show
    @user = User.find(params[:id])
    render json: {
      "code": 200,
      "status": true,
      "message": "get all data successfully",
      "value": @user,
    }
  end

  # GET /news/new
  def new
    @news = News.new
    render json: {
      "code": 200,
      "status": true,
      "message": "get all data successfully",
      "value": @news,
    }
  end

  # GET /news/1/edit
  def edit
  end

  # POST /news or /news.json
  def create
    begin
      @news = News.create(
          title: request.params['title'],
          description: request.params['description'],
          users_id: request.params['users_id'],
      )
      render json: {
        "code": 200,
        "status": true,
        "message": "save data successfully",
        "value": @news,
      }
    rescue
      render json: {
        "code": 400,
        "status": false,
        "message": "save data failed",
      }
    end
  end

  # PATCH/PUT /news/1 or /news/1.json
  def update
    
  end

  # DELETE /news/1 or /news/1.json
  def destroy
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_news
      @news = News.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def news_params
      params.fetch(:news, {})
    end
end
