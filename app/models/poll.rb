class Poll < ActiveRecord::Base

  belongs_to :user
  belongs_to :category
  has_many :options

  accepts_nested_attributes_for :options, allow_destroy: true

  scope :available, -> { where(active: true) }

  validates :user, presence: true
  validates :category, presence: true
  validates :title, presence: true


end
