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

  include PgSearch::Model
  pg_search_scope :search_by_name_and_description,
  against: %i[name description],
  using: {
    tsearch: { prefix: true }
  }

  include PgSearch::Model
  pg_search_scope :search_by_category,
  against: %i[category],
  using: {
    tsearch: { prefix: true }
  }

  private

  def attach_photo
    if photo.attached?
      return
    else
    category_images = {
      CATEGORY[0] => 'babysitting.jpg',
      CATEGORY[1] => 'menage.jpg',
      CATEGORY[2] => 'reparation.jpg',
      CATEGORY[3] => 'dog.jpg',
      CATEGORY[4] => 'jardin.png',
      CATEGORY[5] => 'animation.jpg',
      CATEGORY[6] => 'traiteur.jpg'
    }

    image_filename = category_images[self.category] || 'logo2.png'
    image_path = File.join(Rails.root, 'app/assets/images', image_filename)

    self.photo.attach(io: File.open(image_path), filename: 'image')
    end
  end

end
