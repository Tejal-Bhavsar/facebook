class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
          :jwt_authenticatable,
          :registerable,
          :recoverable,
          jwt_revocation_strategy: Devise::JWT::RevocationStrategies::Null
         
    
end
