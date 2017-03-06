class User < ActiveRecord::Base
  has_many :posts
  has_many :likes, dependent: :destroy
  has_many :posts_liked, through: :likes, source: :post
  has_secure_password
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :name, :alias, presence: true, length: { in: 2..20 } ,:on => :create
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX } , :on => :create
  validates :password, :length => {:within => 8..15},  presence: true,:on => :create
  validates :name, :alias, :allow_blank => true, length: { in: 2..20 } ,:on => :update
  validates :email, :allow_blank => true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX } , :on => :update
  validates :password, :length => {:within => 8..15}, :allow_blank => true,:on => :update
end