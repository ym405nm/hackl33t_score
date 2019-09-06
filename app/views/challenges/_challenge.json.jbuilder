json.extract! challenge, :id, :user_id, :question_id, :result, :created_at, :updated_at
json.url challenge_url(challenge, format: :json)
