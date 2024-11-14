Movie.destroy_all
require 'net/http'
require 'json'
# URL de l'API pour récupérer les films les mieux notés
url = URI("https://tmdb.lewagon.com/movie/top_rated")
# Faire la requête HTTP pour obtenir les données
response = Net::HTTP.get(url)
movies = JSON.parse(response)["results"]
# Créer les films dans la base de données
movies.each do |movie_data|
  Movie.create!(
    title: movie_data["title"],
    overview: movie_data["overview"],
    poster_url: "https://image.tmdb.org/t/p/original#{movie_data['poster_path']}",
    rating: movie_data["vote_average"]
  )
end
