module V1
  class AnagramController < ApplicationController

    def word
      @json = JSON.parse(request.body.read)
      compare_word = @json["word"]

      words_array = Anagram.anagrams_of_word(compare_word)

      respond_to do |format|
        format.any(:words_json, :json) do
          render json: "anagrams of the word #{compare_word}: #{words_array}"
        end
      end
    end

    def count

      word_count = Anagram.count

      respond_to do |format|
        format.any(:words_json, :json) do
          render json: "word_count: #{word_count}"
        end
      end
    end
  end
end