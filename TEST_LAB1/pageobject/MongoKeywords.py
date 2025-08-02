from pymongo import MongoClient

class MongoKeywords:
    def connect_to_mongodb(self, uri, db_name):
        self.client = MongoClient(uri)
        self.db = self.client[db_name]
        return self.db

    def get_collection_count(self, collection_name):
        return self.db[collection_name].count_documents({})

    def insert_one(self, collection_name, data):
        return self.db[collection_name].insert_one(data)

    def find_one(self, collection_name, query):
        return self.db[collection_name].find_one(query)

    def delete_one(self, collection_name, query):
        return self.db[collection_name].delete_one(query)

    def update_one(self, collection_name, query, update):
        return self.db[collection_name].update_one(query, {'$set': update})
