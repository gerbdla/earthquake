Rails.application.routes.draw do

  def api_version(version, &routes)
    api_constraint = ApiConstraint.new(version: version)
    scope(module: "v#{version}", constraints: api_constraint, &routes)
  end

  api_version(1) do
    resources :palindrome, only: [:delete] do
    end
    resources :anagram, only: [:delete] do
    end
    resources :words, only: [:delete, :create] do
    end

    get '/words/count', to: 'words#count'
    get '/palindromes/count', to: 'palindrome#count'
    get 'anagrams/count', to: 'anagram#count'
    post 'anagrams/word', to: 'anagram#word'
  end


end
