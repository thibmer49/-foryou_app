class Offer < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many_attached :photos
  validates :name, :category, :description, :address, :price_per_day, presence: true
  validates :category, inclusion: { in: ["Baby-sitting/Garde d'enfants", "Maison/Décoration", "Réparation/Entretien", "Dog-sitting/Garde d'animaux", "Jardin/Extérieur", "Animation", "Traiteur/Service à table" ] }
  validates :name, length: { minimum: 3 }
  validates :description, length: { minimum: 6 }

  CATEGORY = ["Baby-sitting/Garde d'enfants", "Maison/Décoration", "Réparation/Entretien", "Dog-sitting/Garde d'animaux", "Jardin/Extérieur", "Animation", "Traiteur/Service à table" ]
end
