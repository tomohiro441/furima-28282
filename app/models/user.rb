class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :item_users
  has_many :items
  
  with_options presence: true do
    validates :nickname
    validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :last_name_reading, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :first_name_reading, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :birthday
end

# # 実装の条件
# ## ユーザー情報
# - ニックネームが必須であること
# - メールアドレスが必須であること
# - メールアドレスが一意性であること
# - メールアドレスは@を含む必要があること
# - パスワードが必須であること
# - パスワードは6文字以上であること
# - パスワードは半角英数字混合であること
# - パスワードは確認用を含めて2回入力すること

# 注）emailとpasswordoのバリデーションについては、
#   deviseの導入によってデフォルトでビルトインされているため不要とのこと！

# ##本人情報確認
# - ユーザー本名が、名字と名前がそれぞれ必須であること
# - ユーザー本名は全角（漢字・ひらがな・カタカナ）で入力させること
# - ユーザー本名のフリガナが、名字と名前でそれぞれ必須であること
# - ユーザー本名のフリガナは全角（カタカナ）で入力させること
# - 生年月日が必須であること