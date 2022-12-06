class Post < ApplicationRecord
    include MeiliSearch::Rails
    
    meilisearch do
        # all attributes will be sent to Meilisearch if block is left empty
        displayed_attributes [:id, :author, :title, :body, :tags]
        searchable_attributes [:author, :title, :body, :tags]
        filterable_attributes [:tags]
    end
end