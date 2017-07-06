module V1
  class PalindromeController < ApplicationController

    def count
      count = Palindrome.count
      respond_to do |format|
        format.any(:words_json, :json) do
          render json: "word_count: #{count}"
        end
      end
    end
  end

end
