class Receivable < ActiveRecord::Base
  belongs_to :user
  validates :debtor,  presence: true
  validates :email, presence: true 
  validates :in_debt, presence: true 
  validates :total_debt, presence: true 
end
