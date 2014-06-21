class AdminsController < ApplicationController
  before_action :ensure_signed_in

  load_and_authorize_resource

  def admin_page
    respond_to do |format|
      format.html { render "admin_page" }
    end
  end

  def admin_page_subtract
    respond_to do |format|
      format.html { render "admin_page_subtract" }
    end
  end

  def add_score

    # KEYWORDS:
      # - group_score win - 3, tie - 1
      # - advance_from_group - 5
      # - round_of_sixteen - 5
      # - quarterfinal_score - 10
      # - semifinal_score - 20
      # - championship_score - 40

    team = params["team"]
    player = params["player"]

    Poll.all.each do |p|
      if !team.blank? and !team.nil?
        if p.tier1team1.include?(team) or p.tier1team2.include?(team) or p.tier2team1.include?(team) or p.tier2team2.include?(team) or p.tier3team1.include?(team) or p.tier3team2.include?(team) or p.tier4team1.include?(team) or p.tier4team2.include?(team)
          score = p.attributes[params["round"]]
          score = score + params["score"].to_i

          p.update_column(params["round"].to_sym, score)
          p.save
        end
      end

      if !player.blank? and !player.nil?
        if p.player1.include?(player)
          pscore = p.attributes["player1_score"]
          pscore = pscore + params["score"].to_i

          p.update_column(:player1_score, pscore)
          p.save
        end

        if p.player2.include?(player)
          pscore = p.attributes["player2_score"]
          pscore = pscore + params["score"].to_i

          p.update_column(:player2_score, pscore)
          p.save
        end
      end

    end
    
    respond_to do |format|
      format.html { redirect_to "/admin_page" }
    end
  end


  def subtract_score

    team = params["team"]
    player = params["player"]

    Poll.all.each do |p|
      if !team.blank? and !team.nil?
        if p.tier1team1.include?(team) or p.tier1team2.include?(team) or p.tier2team1.include?(team) or p.tier2team2.include?(team) or p.tier3team1.include?(team) or p.tier3team2.include?(team) or p.tier4team1.include?(team) or p.tier4team2.include?(team)
          score = p.attributes[params["round"]]
          score = score - params["score"].to_i

          p.update_column(params["round"].to_sym, score)
          p.save
        end
      end

      if !player.blank? and !player.nil?
        if p.player1 == player
          pscore = p.attributes["player1_score"]
          pscore = pscore - params["score"].to_i

          p.update_column(:player1_score, pscore)
          p.save
        end

        if p.player2 == player
          pscore = p.attributes["player2_score"]
          pscore = pscore - params["score"].to_i

          p.update_column(:player2_score, pscore)
          p.save
        end
      end

    end

    # check if the team has that team name

    # add the score to each of those teams -- my_string.include? "cde"
    
    respond_to do |format|
      format.html { redirect_to "/admin_page" }
    end
  end

end
