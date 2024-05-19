class User < ApplicationRecord
  has_many :orders
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum role: [:user, :moderator, :admin]
  after_initialize :set_default_role, :if => :new_record?
  def set_default_role
    self.role ||=:user
  end

  private

  def phone_number_must_be_positive
    if phone_number.present? && phone_number.to_i < 0
      errors.add(:phone_number, "must be a positive number")
    end
  end
end
