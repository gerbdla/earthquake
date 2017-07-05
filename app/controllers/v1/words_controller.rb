module V1
  class WordsController < ApplicationController

    def create
      @json = JSON.parse(request.body.read)

      @json["words"].each do |word|
        Word.create!(word: word)
      end

      respond_to do |format|
        format.any(:words_json, :json) do
          render json: "Words Added!"
        end
      end
    end

    def delete
      @json = JSON.parse(request.body.read)

      @json["words"].each do |word|
        Word.delete!(word: word)
      end

      respond_to do |format|
        format.any(:words_json, :json) do
          render json: "Words deleted!"
        end
      end
    end

    def count
      word_count = Word.all.uniq.count
      respond_to do |format|
        format.any(:words_json, :json) do
          render json: "word_count: #{word_count}"
        end
      end
    end
  end
end
