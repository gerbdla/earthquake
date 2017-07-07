class Word < ApplicationRecord


  def self.insert_text
    Word.delete_all

    text = "Either the well was very deep, or she fell very slowly, for she had
     plenty of time as she went down to look about her and to wonder what was
     going to happen next. First, she tried to look down and make out what
     she was coming to, but it was too dark to see anything; then she
     looked at the sides of the well, and noticed that they were filled with
     cupboards and book-shelves; here and there she saw maps and pictures
     hung upon pegs. She took down a jar from one of the shelves as
     she passed; it was labelled ‘ORANGE MARMALADE’, but to her great
     disappointment it was empty: she did not like to drop the jar for fear
     of killing somebody, so managed to put it into one of the cupboards as
     she fell past it."

     Word.create(word: text)

  end

  def self.sanitize_text
    text = Word.first.word
    text = text.downcase.gsub(/([^0-9a-zA-Z])/, " ")
    text.split
  end

  def self.count_words
    words = self.sanitize_text.uniq
    words.count
  end

  def self.add_unique_words(new_words)
    #get the current_text
    text = Word.first.word
    #convert the text to an array of words
    array = self.sanitize_text
    #array to hold the non-unique words
    holder_array = []

    new_words.each do |word|
      #append to holder array
      holder_array << word if !array.include?(word)
    end

    holder_array.each do |word|
      #append to text
      text = text + word
    end
    #save text back to database
    Word.first.update(word: text)
  end

end
