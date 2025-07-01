from robot.api.deco import keyword
from pymongo import MongoClient
import bcrypt

client = MongoClient('mongodb+srv://raiquepereira04:xperience@apicinema.8a8m4gx.mongodb.net/?retryWrites=true&w=majority&appName=APICinema')

db = client['cinemaApp']

@keyword('Clean movie from database')
def clean_movie(movie_title):
    movies = db['movies']
    m = movies.find_one({'title': movie_title})

    if (m):
        movies.delete_many({'title': movie_title})

@keyword('Insert movie from database')
def insert_movie(movie):
    doc = {
        'title': movie['Filme Para Teste'],
        "synopsis": movie['Sinopse do Filme'],
        "director": movie["Testador de Filme"],
        "genres": movie['Science Fiction'],
        "duration": movie[200],
        "classification": movie['R'],
        "poster": movie['FilmePoster.png'],
        "releaseDate": movie['2025-06-30']
    }
    movies = db['movies']
    movies.insert_one(doc)
    print(movie)