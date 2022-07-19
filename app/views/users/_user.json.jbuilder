json.extract! user, :id, :name, :email, :last_name, :phone, :admin, :created_at, :updated_at
json.url user_url(user, format: :json)
