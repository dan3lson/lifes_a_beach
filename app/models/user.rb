class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :beaches
  has_many :reviews
  has_many :upvotes
  has_many :downvotes

  def admin?
    role == "admin"
  end
end
