class User < ApplicationRecord
    EMAIL_FORMAT = /\A[a-zA-Z0-9\-_.]+@[a-zA-Z0-9\-_.]+\z/
    
    has_many :events

    validates :name, presence: true, length: {maximum: 35}
    validates :email, presence: true, length: {maximum: 255}
    validates :email, uniqueness: true 
    validates :email, format: { with: EMAIL_FORMAT }
end
