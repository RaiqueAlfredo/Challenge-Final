from robot.api.deco import keyword
from pymongo import MongoClient
from bson import ObjectId
from datetime import datetime, timezone
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


@keyword('Remove theater from database')
def remove_theater(theater_name):
    theaters = db['theaters']
    
    # Buscar o theater antes de remover
    theater_to_remove = theaters.find_one({'name': theater_name})
    
    if theater_to_remove:
        theater_id = theater_to_remove['_id']
        print(f'Found theater with ID: {theater_id} and name: {theater_name}')
        
        # Remover o theater
        result = theaters.delete_many({'name': theater_name})
        print(f'Removed {result.deleted_count} theater(s) with name: {theater_name}')
        
        return str(theater_id)
    else:
        print(f'No theater found with name: {theater_name}')
        return None
    
    
@keyword('Remove sessions by movie title and theater name')
def remove_sessions_by_names(movie_title, theater_name):
    # Buscar movie pelo título
    movies = db['movies']
    movie = movies.find_one({'title': movie_title})
    
    # Buscar theater pelo nome
    theaters = db['theaters']
    theater = theaters.find_one({'name': theater_name})
    
    if movie and theater:
        movie_id = movie['_id']
        theater_id = theater['_id']
        
        print(f'Found movie "{movie_title}" with ID: {movie_id}')
        print(f'Found theater "{theater_name}" with ID: {theater_id}')
        
        # Remover apenas sessions que usam esses IDs específicos
        sessions = db['sessions']
        result = sessions.delete_many({
            'movie': movie_id,
            'theater': theater_id
        })
        
        print(f'Removed {result.deleted_count} session(s) for this movie/theater combination')
        return result.deleted_count
    else:
        print(f'Movie "{movie_title}" or theater "{theater_name}" not found')
        return 0
    

@keyword('Remove user from database')
def remove_user(user_name):
    users = db['users']
    
    # Buscar o user antes de remover
    user_to_remove = users.find_one({'name': user_name})
    
    if user_to_remove:
        user_id = user_to_remove['_id']
        print(f'Found user with ID: {user_id} and name: {user_name}')
        
        # Remover o user
        result = users.delete_many({'name': user_name})
        print(f'Removed {result.deleted_count} user(s) with title: {user_name}')
        
        return str(user_id)
    else:
        print(f'No user found with name: {user_name}')
        return None
    

@keyword('Insert user from database')
def insert_user(user):
    password_plain = user.get('password', 'qatest321')
    password_hashed = bcrypt.hashpw(password_plain.encode('utf-8'), bcrypt.gensalt())
    
    current_time = datetime.now(timezone.utc)

    doc = {
        'name': user.get('name', 'User Test'),
        "email": user.get('email', 'userTest@example.com'),
        "password": password_hashed.decode('utf-8'),
        "role": user.get('role', 'user'),
        "createdAt": current_time,
        "__v": 0,
        "updatedAt": current_time
    }
    users = db['users']
    result = users.insert_one(doc)
    print(f'User inserted with ID: {result.inserted_id}')
    return str(result.inserted_id)