json.array!(@feedback_responses) do |feedback_response|
  json.extract! feedback_response, :id, :meeting_id, :rating
  json.url feedback_response_url(feedback_response, format: :json)
end
