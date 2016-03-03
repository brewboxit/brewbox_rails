class Poll < ActiveRecord::Base

  belongs_to :user
  belongs_to :category

  scope :available, -> { where(active: true) }

  validates :user, presence: true
  validates :category, presence: true
  validates :title, presence: true


end
