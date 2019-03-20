class Visit < ApplicationRecord
  belongs_to :user
  belongs_to :state
  has_many :comments, dependent: :destroy

end