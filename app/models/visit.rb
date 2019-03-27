class Visit < ApplicationRecord
  belongs_to :user
  belongs_to :state
  has_many :comments, dependent: :destroy

  def name
    "#{user.username}'s visit to #{state.name}"
  end

end