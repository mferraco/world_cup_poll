json.array!(@polls) do |poll|
  json.extract! poll, :id, :user_id, :tiebreaker, :tier1team1, :tier1team2, :tier2team1, :tier2team1, :tier3team1, :tier3team2, :tier4team1, :tier4team2, :name
  json.url poll_url(poll, format: :json)
end
