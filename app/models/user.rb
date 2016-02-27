class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :timeoutable, :omniauthable


  has_many :polls

  validates :firstname, presence: true
  validates :lastname, presence: true


  def password=(new_password)
    attribute_will_change! 'password'
    @password = new_password
    self.encrypted_password = password_digest(@password) if @password.present?
  end

  def to_label
    "#{self.firstname} #{self.lastname}"
  end

end
