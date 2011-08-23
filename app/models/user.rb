# To manage authentification along the site
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
                  :name, :about, :avatar, :note

  before_save :uniquify_name!

  # defaults to user.name
  def to_s
    self.name
  end

  # the part before the at
  def email_prefix
    self.email.split('@').first
  end

private # =====================================================================

  # makes sure name is valued and unique
  # with email prefix and id
  def uniquify_name!
    if self.name.blank? || User.find_by_name(self.name)
      self.name = "#{self.email_prefix}#{self.id}"
    end
  end

end
