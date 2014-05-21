json.array!(@polls) do |poll|
  json.extract! poll, :id, :tier1_team1, :tier1_team2, :tier2_team1, :tier2_team2, :tier3_team1, :tier3_team2, :tier4_team1, :tier4_team2, :player1, :player2, :tiebreaker, :user_id
  json.url poll_url(poll, format: :json)
end
