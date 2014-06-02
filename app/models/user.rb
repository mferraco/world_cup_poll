class User < ActiveRecord::Base
  authenticates_with_sorcery!

  # RELATIONSHIPS
  has_many :polls
  
  # VALIDATIONS
  validates_presence_of :first_name, :last_name, :email
  validates :email, uniqueness: true
  validates :password, length: { minimum: 6 }, unless: :is_google?
  validates :password, confirmation: true, unless: :is_google?
  validates :password_confirmation, presence: true, unless: :is_google?

  # SCOPES
  scope :alphabetical, -> { order('last_name, first_name') }

  def name
    self.last_name + ", " + self.first_name
  end

  def is_google?
    return self.login_type == "google"
  end
end
