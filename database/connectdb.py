# -*- coding: utf-8 -*-
"""
Created on Thu Nov  3 10:15:31 2022

@author: Mario
"""

from decouple import config
import mysql.connector as c
import psycopg2 as conn
from psycopg2 import DatabaseError


def connect_postgresql(hostname, dbname, username, password):
    try:
        conn_query = "host = '" + hostname + "' dbname = '" + dbname + "' user= '" + username + "' password= '" + password + "' port = '5432' sslmode = 'require'"
        conn_post = conn.connect(conn_query)
        print("Database connect successfully to PostgreSQL")
        return conn_post
    except Exception as e:
        # Atrapar error
        print("Ocurrió un error al conectar a PostgreSQL: ", e)
"""        raise Exception(e)

def get_points(username, password, hostname, database, port):
    try:
        db = c.connect(user="{0}".format(username), password="{0}".format(password),
                       host="{0}".format(hostname), database="{0}".format(database), port="{0}".format(port))
        return db
    except Exception as ex:
        return "Error to connect to MySQL: {0}".format(ex)
"""
def get_connection():
    try:
        connection = connect_postgresql(
            config('HOST_NAME_HEROKU'),
            config('DATABASE_HEROKU'),
            config('USER_NAME_HEROKU'),
            config('PASSWORD_HEROKU')
        )
        return connection
    except Exception as ex:
        raise ex

"""

def get_connectionMySQL():
    try:
        return get_points(
            config('USER_NAME'),
            config('PASSWORD'),
            config('HOSTNAME'),
            config('DATABASE'),
            config('PORT')
        )
    except Exception as ex:
        raise ex
"""
