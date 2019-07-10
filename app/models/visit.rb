class Visit < ApplicationRecord
  belongs_to :user
  belongs_to :state
  has_many :comments, dependent: :destroy
  validates :rating, presence: true


  def name
    "#{user.username}'s visit to #{state.name}"
  end

  def self.avg
    average(:rating)
  end

  # rating integer
  # student_id
  # course_id


  #Show only visits with a rating over 7
  def self.highest_rated
    where('rating > 7')
  end

  def self.rating_over(num)
    where('rating > ?', num)
  end
  #scope :rating_over, ->(num) {where('rating > ?', num)}

  # order our visits by rating
  def self.order_by_rating
    #order("rating desc")
    order(:rating => "desc")
  end




end