class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :messages, dependent: :restrict_with_error # 子レコードがある場合は削除できず、親レコードにエラー情報が付加される。（引き留めパターン）
end
