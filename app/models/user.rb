class User < ActiveRecord::Base
    
    validates :name, presence: true
    validates :email, presence: true, format: { with: /\A\S+@\S+\.\S+\z/, message: 'invalid format' }

    has_secure_password
end
