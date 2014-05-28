namespace :db do
  desc "Erase and fill database"
  # creating a rake task within db namespace called 'populate'
  # executing 'rake db:populate' will cause this script to run
  task :team => :environment do
    # Invoke rake db:migrate just in case...
    Rake::Task['db:migrate'].invoke
    
    # Need a gem to make this work: populator
    # Docs at: http://populator.rubyforge.org/
    require 'populator'
    
    # Step 0: clear any old data in the db
    [Team].each(&:delete_all)
    
    teams = [["Brazil", 1], ["Spain", 1], ["Germany", 1], ["Argentina", 1], ["Colombia", 1], ["Belgium", 1], ["Uruguay", 1], ["Switzerland", 1],
             ["Netherlands", 2], ["Italy", 2], ["England", 2], ["Chile", 2], ["United States", 2], ["Portugal", 2], ["Greece", 2], ["Bosnia & Herzegovina", 2],
             ["Ivory Coast", 3], ["Croatia", 3], ["Russia", 3], ["France", 3], ["Ecuador", 3], ["Ghana", 3], ["Mexico", 3], ["Costa Rica", 3],
             ["Algeria", 4], ["Nigeria", 4], ["Honduras", 4], ["Japan", 4], ["Iran", 4], ["South Korea", 4], ["Australia", 4], ["Cameroon", 4]]

    teams.each do |t|
      team = Team.new
      team.name = t[0]
      team.tier = t[1]
      team.score = 0
      team.save!
      puts "Created " + team.name
    end

  end
end