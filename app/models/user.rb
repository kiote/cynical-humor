# == Schema Information
#
# Table name: users
#
#  id            :integer(4)      not null, primary key
#  email         :string(255)
#  password_hash :string(255)
#  password_salt :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#
class User < ActiveRecord::Base
  has_many :posts

  attr_accessor :password
  validates_confirmation_of :password
  validates :password, :on => :create, :presence => true
  validates :email, :presence => true
  validates_uniqueness_of :email

  before_save :encrypt_password

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "32x32>" }

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else 
      nil
    end
  end

  def self.auth? session
    return false if session[:user_id].nil?
    true
  end
end