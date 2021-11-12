List.destroy_all
Movie.destroy_all
10.times do
  url = "http://tmdb.lewagon.com/movie/top_rated"
  movies = open(url).read
  movie = JSON.parse(movies)
  movie_results = movie['results']
  movie_poster = "https://image.tmdb.org/t/p/w500"
  movie_results.each do |movie|
  new_movie = Movie.create(title: movie['title'], overview: movie['overview'], poster_url: movie_poster + movie['poster_path'], rating: movie['vote_average'])
  puts "#{new_movie.title} has been created!"
  new_movie.save!
  end
end
