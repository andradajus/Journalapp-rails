
class User < ApplicationRecord
  has_many :entries
  has_many :reminders
  attr_accessor :password_confirmation
  before_create :set_uid

  validates :password, presence: true, length: { minimum: 6 }, if: :password_required?
  validates :password_confirmation, presence: true, if: :password_required?
  validate :password_match, if: :password_required?

  private

  def set_uid
    self.uid = User.maximum(:uid).to_i + 1
  end

  def encrypt_password
    self.password_digest = BCrypt::Password.create(password) if password.present?
  end

  def password_required?
    new_record? || password.present?
  end

  def password_match
    errors.add(:password_confirmation, "doesn't match Password") if password != password_confirmation
  end
end
