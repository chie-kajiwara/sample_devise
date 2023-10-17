class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def password=(new_password)
    if new_password.present? && valid_password?(new_password)
      self.errors.add(:password, '現在のパスワードと同じものは、新しいパスワードとして設定できません。')
      raise ActiveRecord::RecordInvalid, self
    end
    super(new_password)
  end
end
