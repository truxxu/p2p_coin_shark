class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def full_address
    address + " " + city
  end

  geocoded_by :full_address
  after_validation :geocode, if: :will_save_change_to_address?
end
