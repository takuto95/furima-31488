class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items

  with_options presence: true do
    validates :nickname
    with_options format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'is invalid. Input full-width characters.' } do
      validates :name_first
      validates :name_last
    end
    with_options format: { with: /\A[ァ-ヶー－]+\z/, message: 'is invalid. Input full-width katakana characters.' } do
      validates :name_reading_first
      validates :name_reading_last
    end
    validates :birthday
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze, message: 'には英字と数字の両方を含めて設定してください' }
  end
end
