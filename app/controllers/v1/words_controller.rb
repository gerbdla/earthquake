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

    def create
      @json = JSON.parse(request.body.read)

      @json["words"].each do |word|
        Word.create!(word: word)
      end

      respond_to do |format|
        format.any(:words_json, :json) do
          render json: "Success"
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
