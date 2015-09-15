json.array!(@responses) do |response|
  json.extract! response, :id, :club, :name, :feedback, :phone_number, :rating, :email, :misc
  json.url response_url(response, format: :json)
end
