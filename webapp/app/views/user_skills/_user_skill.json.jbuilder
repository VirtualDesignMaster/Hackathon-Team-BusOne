json.extract! user_skill, :id, :user_id, :skill_id, :proficiency, :years, :created_at, :updated_at
json.url user_skill_url(user_skill, format: :json)
