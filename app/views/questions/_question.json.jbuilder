json.extract! question, :id, :name, :image_url, :answer, :description, :created_at, :updated_at
json.url question_url(question, format: :json)
