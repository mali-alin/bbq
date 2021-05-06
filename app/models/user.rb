class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    
  has_many :events
  has_many :comments
  has_many :subscriptions

  validates :username, presence: true, length: {maximum: 35}

  before_validation :set_name, on: :create

  after_commit :lnk_subscriptions, on: :create
  
  private

  def set_name
    self.username = "Товарищ №#{rand(777)}" if self.username.blank?
  end

  def link_subscriptions
    Subscription.where(user_id: nil, user_email: user.email).update_all(user_id: user.id)
  end
end
