from robot.api.deco import keyword
from pymongo import MongoClient
import bcrypt

client = MongoClient('mongodb+srv://raiquepereira04:xperience@apicinema.8a8m4gx.mongodb.net/?retryWrites=true&w=majority&appName=APICinema')

db = client['test']

@keyword('Remove movie from database')
def remove_movie(movie_title):
    movies = db['movies']
    
    # Buscar o filme antes de remover
    movie_to_remove = movies.find_one({'title': movie_title})
    
    if movie_to_remove:
        movie_id = movie_to_remove['_id']
        print(f'Found movie with ID: {movie_id} and title: {movie_title}')
        
        # Remover o filme
        result = movies.delete_many({'title': movie_title})
        print(f'Removed {result.deleted_count} movie(s) with title: {movie_title}')
        
        return str(movie_id)
    else:
        print(f'No movie found with title: {movie_title}')
        return None

@keyword('Insert movie from database')
def insert_movie(movie):
    doc = {
        'title': movie.get('title', 'Filme Para Teste'),
        "synopsis": movie.get('synopsis', 'Sinopse do Filme'),
        "director": movie.get('director', 'Testador de Filme'),
        "genres": movie.get('genres', ['Science Fiction']),
        "duration": movie.get('duration', 200),
        "classification": movie.get('classification', 'R'),
        "poster": movie.get('poster', 'FilmePoster.png'),
        "releaseDate": movie.get('releaseDate', '2025-06-30')
    }
    movies = db['movies']
    result = movies.insert_one(doc)
    print(f'Movie inserted with ID: {result.inserted_id}')
    return str(result.inserted_id)