class Poll < ActiveRecord::Base

  belongs_to :user

  after_save :update_total

  TIER_1 = ["Brazil (11 - host)", "Spain (1)", "Germany (2)", "Argentina (3)", "Colombia (4)", "Belgium (5)", "Uruguay (6)", "Switzerland (7)"]
  TIER_2 = ["Netherlands (8)", "Italy (9)", "England (10)", "Chile (12)", "United States (13)", "Portugal (14)", "Greece (15)", "Bosnia & Herzegovina (16)"]
  TIER_3 = ["Ivory Coast (17)", "Croatia (18)", "Russia (19)", "France (21)", "Ecuador (22)", "Ghana (23)", "Mexico (24)", "Costa Rica (31)"]
  TIER_4 = ["Algeria (32)", "Nigeria (33)", "Honduras (34)", "Japan (44)", "Iran (49)", "South Korea (56)", "Australia (57)", "Cameroon (59)"]

  validates_presence_of :user_id, :tiebreaker, :tier1team1, :tier1team2, :tier2team1, :tier2team2, :tier3team1, :tier3team2, :tier4team1, :tier4team2, :player1, :player2, :name
  validates :tier1team1, inclusion: TIER_1
  validates :tier1team2, inclusion: TIER_1
  validates :tier2team1, inclusion: TIER_2
  validates :tier2team2, inclusion: TIER_2
  validates :tier3team1, inclusion: TIER_3
  validates :tier3team2, inclusion: TIER_3
  validates :tier4team1, inclusion: TIER_4
  validates :tier4team2, inclusion: TIER_4

  validate :check_tier1

  def check_tier1
      errors.add(:tier1team1, "Tier 1 teams can't be the same." ) if tier1team1 == tier1team2
  end

  validate :check_tier_2

  def check_tier_2
      errors.add(:tier2team1, "Tier 2 teams can't be the same." ) if tier2team1 == tier2team2
  end

  validate :check_tier_3

  def check_tier_3
      errors.add(:tier3team1, "Tier 3 teams can't be the same." ) if tier3team1 == tier3team2
  end

  validate :check_tier_4

  def check_tier_4
      errors.add(:tier4team1, "Tier 4 teams can't be the same." ) if tier4team1 == tier4team2
  end

  # SCOPES

  scope :by_score, -> { order('score DESC') }
  scope :by_user, -> { joins(:user).order('last_name, first_name, name') }
  scope :for_user, ->(user_id) { where("user_id = ?", user_id) }


  def update_total
    total_score = self.group_score + self.advance_from_group + self.round_of_sixteen + self.quarterfinal_score + self.semifinal_score + self.championship_score + self.player1_score + self.player2_score
    self.update_column(:score, total_score)
  end

end
