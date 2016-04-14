class Option < ActiveRecord::Base
  belongs_to :poll

  validates :value, presence: true
  # validates :poll, presence: true

  def to_s
    self.label.blank? ? self.value : self.label
  end

end
