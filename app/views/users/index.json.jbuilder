json.array!(@users) do |user|
  json.extract! user, :id, :first_name, :last_name, :email, :phone, :role, :uid, :refresh_token, :access_token, :expires
  json.url user_url(user, format: :json)
end
