Rails.application.routes.draw do
  def api_version(version, &routes)
    api_constraint = ApiConstraint.new(version: version)
    scope(module: "v#{version}", constraints: api_constraint, &routes)
  end

  api_version(1) do
    resources :palindrome, only: :index
    resources :anagram, only: :index
  end


end
