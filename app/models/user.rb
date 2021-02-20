class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :items
  has_many :orders
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do
    validates :nickname
    validates :email
    validates :password
    validates :family_name
    validates :first_name
    validates :family_name_kana 
    validates :first_name_kana
    validates :birth
  end

  with_options format: {with: /\A[ぁ-んァ-ン一-龥]+\z/} do
    validates :family_name
    validates :first_name
  end

  with_options format: {with: /\A[ァ-ヶー－]+\z/} do
    validates :family_name_kana
    validates :first_name_kana
  end

  with_options length: { minimum: 6 }, format:{ with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i} do
    validates :password
  end
end