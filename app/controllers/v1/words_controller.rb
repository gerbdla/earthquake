module V1
  class WordsController < ApplicationController

    def delete_word
      articles = [
          {id: 123, name: 'The Things'},
      ]

      respond_to do |format|
        format.any(:articles_json, :json) do
          render json: articles
        end
      end
    end

    def add_words
      articles = [
          {id: 123, name: 'The Things'},
      ]

      respond_to do |format|
        format.any(:articles_json, :json) do
          render json: articles
        end
      end
    end


    def delete_words
      articles = [
          {id: 123, name: 'The Things'},
      ]

      respond_to do |format|
        format.any(:articles_json, :json) do
          render json: articles
        end
      end
    end
  end

end
