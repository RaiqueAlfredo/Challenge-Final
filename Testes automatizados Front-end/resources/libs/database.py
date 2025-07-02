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