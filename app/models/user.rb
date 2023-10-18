class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validate :valid_reset_password

  def valid_reset_password
    if password.present? && Devise::Encryptor.compare(self.class, encrypted_password_was, password)
      errors.add(:password, '現在のパスワードと同じものは、新しいパスワードとして設定できません。')
    end
  end
end
