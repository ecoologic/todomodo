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
    self.name.presence || self.default_name
  end

  # the part before the at
  def email_prefix
    self.email.split('@').first
  end

  # email prefix and id, makes a unique name
  def default_name
    "#{self.email_prefix}#{self.id}"
  end

private # =====================================================================

  # if name is not unique it is replaced with email_prefix and id
  def uniquify_name!
    others_same_name = User.where(:name => self.name).select(:id)
    others_same_name.delete self
    name_is_uniq = self.name.blank? || others_same_name.any?
    self.name = nil unless name_is_uniq
  end

end
