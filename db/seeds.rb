require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "Cleaning up database..."

# DO NOT REMOVE
Offer.destroy_all

User.destroy_all

10.times do
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    pseudo: Faker::Name.name,
    email: Faker::Internet.email,
    address: Faker::Address.full_address,
    password: Faker::Internet.password,
    phone_number: Faker::PhoneNumber.phone_number_with_country_code,
    birth_date: Faker::Date.birthday
  )
end

puts "Database cleaned"

Offer.create!(
    user: User.all.sample,
    price_per_day: 26,
    description: "Passionné de mécanique et de tunning, je répare votre voiture
    en respectant la mécanique. Mercedes, BMW, avec moi, votre voiture c'est du Fast & Furious !",
    address: "15, Avenue Félix d'Hérelle, 75016 PARIS",
    category: "Réparation/Entretien",
    name: "Lopez, réparateur de voiture de père en fils"
)

Offer.create!(
    user: User.all.sample,
    price_per_day: 76,
    description: "Après plusieurs années à avoir animé une émission sur les
    plantes et les jardins, je mets à contribution mes connaissances dans la
    construction de vos potagers et de vos serres.",
    address: "16, Villa Gaudelet 75011 PARIS",
    category: "Jardin/Extérieur",
    name: "Silence ça pousse !"
)
Offer.create!(
    user: User.all.sample,
    price_per_day: 49,
    description: "J'aime m'occuper d'enfant depuis le plus jeune âge !
    Jeux, créativité, éducation, votre enfant est entre de bonnes mains.",
    address: "11, rue Adolphe Mille 75019 PARIS",
    category: "Baby-sitting/Garde d'enfants",
    name: "CATHY NOUNOU"
)

Offer.create!(
    user: User.all.sample,
    price_per_day: 51,
    description: "Je me suis pris de passion pour la décoration.
    Je m'appelle Valérie et je rénove votre intérieur !",
    address: "65, Avenue de la République PARIS",
    category: "Maison/Décoration",
    name: "Envie d'un nouvel intérieur ?"
)
Offer.create!(
    user: User.all.sample,
    price_per_day: 76,
    description: "VOUS EN AVEZ MARRE DE VOTRE TOUTOU ? VOUS PERDEZ PATIENCE ?
    Avec moi, Pascal, je rééduque votre chien et je m'en occupe quand vous n'êtes pas là !",
    address: "13, Rue Saint-Maur 75011 PARIS",
    category: "Dog-sitting/Garde d'animaux",
    name: "Votre chien : mon ami !"
)

Offer.create!(
    user: User.all.sample,
    price_per_day: 100,
    description: "Vous avez zéro budget pour le plus beau jour de votre vie ?
    Pourtant vous souhaitez avoir le mariage de vos rêves ? Nous jeune groupe de musique,
    nous animons votre mariage pour un petit budget mais en échange de publicité !
    Reggae, Pop-Rock, Opéra, nous nous adaptons à votre demande",
    address: "55 rue du Faubourg Saint-Honoré, PARIS",
    category: "Animation",
    name: "Les Vedettes : vos sauveurs pour événements !"
)
Offer.create!(
    user: User.all.sample,
    price_per_day: 120,
    description: "J'aime quand y'a du croquant, et quand c'est bon. Vous voulez impressionner vos convives ?
    Je propose une cuisine colorée et locale !",
    address: "36 Avenue du 8 mai, 49290 CHALONNES-SUR-LOIRE",
    category: "Traiteur/Service à table",
    name: "Je rajoute du croquant dans votre assiette"
)

Offer.create!(
    user: User.all.sample,
    price_per_day: 95,
    description: "Je shake shake pour vos événements privés, dans votre jardin, en intérieur. J'ai tout à disposition !",
    address: "1 rue Montesquieu, PARIS",
    category: "Traiteur/Service à table",
    name: "Barman à domicile !"
)
puts "Offers created"
