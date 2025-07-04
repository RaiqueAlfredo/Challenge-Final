from robot.api.deco import keyword
from pymongo import MongoClient
from bson import ObjectId
from datetime import datetime, timezone
from dotenv import load_dotenv
import bcrypt
import os

load_dotenv()

MONGODB_URI = os.getenv('MONGODB_URI', 'mongodb://localhost:27017')
MONGODB_DATABASE = os.getenv('MONGODB_DATABASE', 'test')

client = MongoClient(MONGODB_URI)
db = client[MONGODB_DATABASE]

    
@keyword('Remove user from database')
def remove_user(user_name):
    result = db['users'].delete_many({'name': user_name})
    print(f'Removed {result.deleted_count} user(s) with name: {user_name}')
    return result.deleted_count > 0


@keyword('Remove reservations by user name')
def remove_reservations_by_user_name(user_name):
    users = db['users']
    reservations = db['reservations']
    
    try:
        # Buscar usuário pelo nome
        user = users.find_one({'name': user_name})
        
        if user:
            user_id = user['_id']
            print(f'Found user "{user_name}" with ID: {user_id}')
            
            # Remover reservas do usuário
            result = reservations.delete_many({'user': user_id})
            print(f'Removed {result.deleted_count} reservation(s) for user "{user_name}"')
            
            return result.deleted_count
        else:
            print(f'User "{user_name}" not found')
            return 0
            
    except Exception as e:
        print(f'Error: {e}')
        return 0