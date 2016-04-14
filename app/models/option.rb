class Option < ActiveRecord::Base
  belongs_to :poll

  validates :value, presence: true
  # validates :poll, presence: true

end
