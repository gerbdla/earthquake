module V1
  class PalindromeController < ApplicationController
    def anagram_count
      articles = [
          {id: 123, name: 'The Things'},
      ]

      respond_to do |format|
        format.any(:articles_json, :json) do
          render json: articles
        end
      end
    end

    def anagram_words
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
