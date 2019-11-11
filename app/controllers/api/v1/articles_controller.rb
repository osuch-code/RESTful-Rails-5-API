module Api # CAPITAL Api
  module V1 # CAPITAL V 
    class ArticlesController < ApplicationController
      # INDEX - SHOW ALL ARTICLES POSTMANED
      def index
        articles = Article.order('created_at DESC');
        render json: {status: 'SUCCESS', message:'Articles Loaded', data:articles},status: :ok
      end
      # SHOW ARTICLE BY ID POSTMANED
      def show
        article = Article.find(params[:id])
        render json: {status: 'SUCCESS', message:'Article Loaded', data:article},status: :ok
      end
      # CREATE ARTICLE POSTMANED
      def create
        article = Article.new(article_params)

        if article.save
          render json: {status: 'SUCCESS', message:'Article Saved', data:article},status: :ok
        else
          render json: {status: 'ERROR', message:'Article NOT Saved', data:article.errors},status: :unprocessable_entity
        end
      end
      # DESTROY ARTICLE BY ID POSTMANED
      def destroy
        article = Article.find(params[:id])
        article.destroy
        render json: {status: 'SUCCESS', message:'Article Deleted', data:article},status: :ok
      end
      # UPDATE ARTICLE BY ID POSTMANED
      def update
        article = Article.find(params[:id])
        if article.update_attributes(article_params)
          render json: {status: 'SUCCESS', message:'Article Updated', data:article},status: :ok
        else
          render json: {status: 'ERROR', message:'Article NOT Updated', data:article.errors},status: :unprocessable_entity
        end
      end

      private
      # PARAMS PERMITTED WHEN UPDATING - no need to sepcify in Postman as gives errors if ether is blank
      def article_params
        params.permit(:title, :body)
      end
    end
  end
end
