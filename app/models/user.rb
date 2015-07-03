class User < ActiveRecord::Base

  belongs_to  :organization
  has_many    :given_merits,    class_name: "Merit", foreign_key: "meritor_id"
  has_many    :received_merits, class_name: "Merit", foreign_key: "meritee_id"

  before_save { email.downcase! }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
end
