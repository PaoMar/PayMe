class User < ActiveRecord::Base
 has_secure_password

 has_many :receivables, dependent: :destroy

 validates_uniqueness_of :email
end



