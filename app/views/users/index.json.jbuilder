json.array!(@users) do |user|
  json.extract! user, :id, :email, :password_digest, :name, :confirmation_token, :remember_token, :uid, :token, :pid
  json.url user_url(user, format: :json)
end
