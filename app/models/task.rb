class Task < ActiveRecord::Base
  belongs_to :user
  validates :name, presence: true
  include RankedModel
  ranks :order_number
end
