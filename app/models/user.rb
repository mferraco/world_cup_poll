class User < ActiveRecord::Base

  # RELATIONSHIPS
  has_many :polls

  # VALIDATIONS
  validates_presence_of :first_name, :last_name, :email

  # SCOPES
  scope :alphabetical, -> { order('last_name, first_name') }

  def name
    self.last_name + ", " + self.first_name
  end

end
