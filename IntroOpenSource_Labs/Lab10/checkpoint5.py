from pymongo import MongoClient
from pymongo import *
from bson.objectid import ObjectId
import datetime
from random import randint


client = MongoClient()
db = client.csci2963
#generate a random number
n = db.definitions.count();
r = randint(0,n)

# find the i_th word such that i = r
i = 0
w = "Snail Mail"
for word in db.definitions.find():
    if i == r:
        w = word["word"]
        t = str(datetime.datetime.now())
        print(w)
        db.definitions.update({"word":w}, {"$push": {"dates": t}})
        break
    i+=1
print(w)
print(db.definitions.find_one({"word":w}))



def random_word_requester():
    '''
    This function should return a random word and its definition and also
    log in the MongoDB database the timestamp that it was accessed.
    '''
    return


if __name__ == '__main__':
    print random_word_requester()
