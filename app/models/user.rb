
class User < ApplicationRecord
  has_secure_password
  before_save :encrypt_password
  before_create :set_uid
  has_many :entries
  has_many :reminders
  has_many :tasks
  has_secure_password



  validates :password, presence: true, length: { minimum: 6 }, if: :password_required?
  validates :password_confirmation, presence: true, if: :password_required?
  validate :password_match, if: :password_required?
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :country, presence: true
  validates :birthday, presence: true
  validate :validate_birthday_format

  attr_accessor :password_confirmation
  private

  def admin?
    admin
  end

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

  def validate_birthday_format
    errors.add(:birthday, 'is not a valid date') if birthday.present? && !birthday.is_a?(Date)
  end
end
