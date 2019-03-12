json.extract! movie, :id, :title, :date, :description, :image, :byline, :created_at, :updated_at
json.url movie_url(movie, format: :json)
