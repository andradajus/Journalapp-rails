json.extract! user, :id, :uid, :username, :email, :first_name, :middle_name, :last_name, :birthday, :country, :password_digest, :created_at, :updated_at
json.url user_url(user, format: :json)
