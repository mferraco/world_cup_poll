namespace :db do
  desc "Erase and fill database"
  # creating a rake task within db namespace called 'populate'
  # executing 'rake db:populate' will cause this script to run
  task :populate => :environment do
    # Invoke rake db:migrate just in case...
    Rake::Task['db:migrate'].invoke
    
    # Need a gem to make this work: populator
    # Docs at: http://populator.rubyforge.org/
    require 'populator'
    
    # Step 0: clear any old data in the db
    [Poll, User].each(&:delete_all)
    

    TIER_1 = ["Spain (1)", "Germany (2)", "Argentina (3)", "Colombia (4)", "Belgium (5)", "Uruguay (6)", "Switzerland (7)","Brazil (11)"]
    TIER_2 = ["Netherlands (8)", "Italy (9)", "England (10)", "Chile (12)", "United States (13)", "Portugal (14)", "Greece (15)", "Bosnia & Herzegovina (16)"]
    TIER_3 = ["Ivory Coast (17)", "Croatia (18)", "Russia (19)", "France (21)", "Ecuador (22)", "Ghana (23)", "Mexico (24)", "Costa Rica (31)"]
    TIER_4 = ["Algeria (32)", "Nigeria (33)", "Honduras (34)", "Japan (44)", "Iran (49)", "South Korea (56)", "Australia (57)", "Cameroon (59)"]

    PLAYERS = ["Christiano Ronaldo", "Clint Dempsey", "Wayne Rooney", "Lionel Messi", "Didier Drogba", "David Villa", "Luis Suarez"]

    users = [
      {
        first_name: "Mike",
        last_name: "Ferraco",
        email: "ferraco.mike@gmail.com",
        password: "michael",
        password_confirmation: "michael",
        login_type: "generic",
        role: "Admin"
      },
      {
        first_name: "Nate",
        last_name: "Ferraco",
        email: "ferraco.nate@gmail.com",
        password: "nathaniel",
        password_confirmation: "nathaniel",
        login_type: "generic",
        role: "User"
      },
      {
        first_name: "Nicole",
        last_name: "Ferraco",
        email: "ferraco.nicole@gmail.com",
        password: "nicole",
        password_confirmation: "nicole",
        login_type: "generic",
        role: "User"
      },
      {
        first_name: "Jamey",
        last_name: "Pileggi",
        email: "pileggi.jamey@gmail.com",
        password: "jamey1",
        password_confirmation: "jamey1",
        login_type: "generic",
        role: "User"
      }
    ]

    user_ids = []
    users.each do |u|
      user = User.create(u)
      user_ids.push(user.id)
      puts "Created " + u[:first_name] + " " + u[:last_name]
    end

    polls = []

    (1..10).each do |i|
      tier1 = (0..7).to_a.sample 2
      tier2 = (0..7).to_a.sample 2
      tier3 = (0..7).to_a.sample 2
      tier4 = (0..7).to_a.sample 2 

      player1 = (0..6).to_a.sample 2 
      player2 = (0..6).to_a.sample 2 

      polls.push(
      {
        name: "Poll " + i.to_s,
        tier1team1: TIER_1[tier1[0]], 
        tier1team2: TIER_1[tier1[1]],
        tier2team1: TIER_2[tier2[0]], 
        tier2team2: TIER_2[tier2[1]],
        tier3team1: TIER_3[tier3[0]], 
        tier3team2: TIER_3[tier3[1]],
        tier4team1: TIER_4[tier4[0]],
        tier4team2: TIER_4[tier4[1]],
        player1: PLAYERS[player1[0]], 
        player2: PLAYERS[player1[1]],
        tiebreaker: 18,
        user_id: user_ids[Random.rand(4)]
      })
    end

    polls.each do |p|
      Poll.create(p)
      puts "Created " + p[:name]
    end

  end
end