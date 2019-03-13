class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :loans
  has_many :requests
  #has_many :requests_as_owner, through: :loans, source: :requests

  ID_TYPE = ["Passport", "Driver's License", "Birth Certificate", "Permanent Resident Card"]

  validates :first_name, presence: true, length: { minimum: 2 }
  validates :last_name, presence: true, length: { minimum: 2 }
  validates :id_type, presence: true, inclusion: { in: ID_TYPE }
  validates :id_number, presence: true, uniqueness: true
  validates :address, presence: true
  validates :city, presence: true
  validates :photo, presence: true
  validates :username, presence: true, uniqueness: true, length: { minimum: 5 }
  validates :telephone, presence: true, uniqueness: true, numericality: true, length: { maximum: 10 }

  mount_uploader :photo, PhotoUploader

  def full_address
    address + " " + city
  end

  geocoded_by :full_address
  after_validation :geocode, if: :will_save_change_to_address?
end
