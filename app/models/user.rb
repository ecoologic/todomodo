# To manage authentification along the site
class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # store avatar path with carrierwave
  mount_uploader :avatar, AvatarUploader

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
                  :name, :about, :avatar, :remote_avatar_url, :note

  before_save :uniquify_name!

  # defaults to user.name
  def to_s
    self.name.presence || self.default_name
  end

  # friendly url like /users/2-erik
  def to_param
    "#{self.id}-#{self}"
  end

  # the part before the at
  def email_prefix
    self.email.split('@').first
  end

  # email prefix and id, makes a unique name
  def default_name
    "#{self.email_prefix}-#{self.id}"
  end

private # =====================================================================

  # TODO: username should never change
  # if name is not unique it is replaced with default_name
  def uniquify_name!
    others_same_name = User.where(:name => self.name) #.select(:id)
    others_same_name.all.delete self # without .all the record gets deleted!
    name_is_uniq = self.name.blank? || others_same_name.empty?
    self.name = nil unless name_is_uniq # nil is correct, to_s will give a unique name
    self.name
  end

end
