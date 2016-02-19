Rails.application.routes.draw do
  models = [
    :accounts, :comments, :documents, :profiles, :snippets, :translations
  ]

  models.each do |model|
    if model == :accounts
      resources model, except: [:index, :show]
    else
      resources model
    end
  end
end
