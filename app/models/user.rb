class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::Allowlist

  devise(
    :database_authenticatable,
    :registerable,
    :recoverable,
    :validatable,
    :jwt_authenticatable,
    jwt_revocation_strategy: self,
  )

  validates :name, presence: true

  has_many :kids
  belongs_to :current_kid, class_name: 'Kid', optional: true
end
