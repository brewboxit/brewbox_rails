class Category < ActiveRecord::Base

  before_save :set_slug

  has_many :polls

  def set_slug
    self.slug = "#{self.name.parameterize.underscore}"
  end

  def count
    self.polls.count
  end

end
