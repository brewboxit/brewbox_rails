class Question < ActiveRecord::Base

  belongs_to :user

  validates :title, presence: true

  def as_json(options)
  # this example ignores the user's options
  super(:only => [:email, :handle])
end

end
