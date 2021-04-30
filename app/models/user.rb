class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    
  has_many :events

  validates :username, presence: true, length: {maximum: 35}

  before_validation :set_name, on: :create
  
  private

  def set_name
    self.username = "Товарищ №#{rand(777)}" if self.username.blank?
  end
end
