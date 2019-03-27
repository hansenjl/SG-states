class Visit < ApplicationRecord
  belongs_to :user
  belongs_to :state
  has_many :comments, dependent: :destroy

  validates :rating, presence: true
 # accepts_nested_attributes_for :state, reject_if: lambda {|attributes| attributes['name'].blank?}

  accepts_nested_attributes_for :comments, reject_if: lambda {|attributes| attributes['text'].blank?}

  def state_attributes=(attributes)
    if !attributes[:name].empty?
      self.state_id = State.find_or_create_by(name: attributes[:name]).id
    end
  end


  def name
    "#{user.username}'s visit to #{state.try(:name)}"
  end

end