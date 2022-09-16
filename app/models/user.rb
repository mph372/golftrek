class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :itineraries
  has_one :favorite_course
  after_create :build_profile
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def build_profile
    FavoriteCourse.create(user: self) # Associations must be defined correctly for this syntax, avoids using ID's directly.
  end
end
