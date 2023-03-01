class Offer < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_one_attached :photo
  validates :name, :category, :description, :address, :price_per_day, presence: true
  validates :category, inclusion: { in: ["Baby-sitting/Garde d'enfants", "Maison/Décoration", "Réparation/Entretien", "Dog-sitting/Garde d'animaux", "Jardin/Extérieur", "Animation", "Traiteur/Service à table" ] }
  validates :name, length: { minimum: 3 }
  validates :description, length: { minimum: 6 }
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  CATEGORY = ["Baby-sitting/Garde d'enfants", "Maison/Décoration", "Réparation/Entretien", "Dog-sitting/Garde d'animaux", "Jardin/Extérieur", "Animation", "Traiteur/Service à table" ]

  before_save :attach_photo

  private

  def attach_photo
    return if photo.attached?
    self.photo.attach(io: File.open(File.join(Rails.root,'app/assets/images/logo2.png')), filename: 'image')
  end
end
