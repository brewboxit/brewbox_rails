class User < ActiveRecord::Base

  has_many :questions

  validates :firstname, presence: true
  validates :lastname, presence: true

  def to_label
    "#{self.firstname} #{self.lastname}"
  end

end
