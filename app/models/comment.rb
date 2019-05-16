class Comment < ApplicationRecord
  belongs_to :visit
  belongs_to :user


   def self.order_by_time
    #order("rating desc")
    order(:create_at => "desc").limit(3)
  end
end