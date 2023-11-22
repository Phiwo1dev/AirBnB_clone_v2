-- Creates a MySQL server with:
--   Database hbnb_dev_db.
--   User hbnb_dev with password hbnb_dev_pwd in localhost
--   Grants SELECT privileges for hbnb_dev on performance
--   Grants all priviledges for hbnb_dev on hnh_dev_db

-- Connect to the MySQL server as root (adjust the credentials if needed)
db = MySQLdb.connect(
    host='localhost',
    port=3306,
    user='root',
    passwd='your_root_password'
)

-- Create cursor object to execute queries
cursor = db.cursor()

-- Creates the database if it doesn't exist
cursor.execute("CREATE DATABASE IF NOT EXISTS hbnb_dev_db")

-- Creates the user if it doesn't exist and set the password
cursor.execute("CREATE USER IF NOT EXISTS 'hbnb_dev'@'localhost' IDENTIFIED BY 'hbnb_dev_pwd'")

-- Grants all privileges on hbnb_dev_db to hbnb_dev
cursor.execute("GRANT ALL PRIVILEGES ON hbnb_dev_db.* TO 'hbnb_dev'@'localhost'")

-- Grants SELECT privilege on performance_schema to hbnb_dev
cursor.execute("GRANT SELECT ON performance_schema.* TO 'hbnb_dev'@'localhost'")

-- Flushes privileges to apply changes
cursor.execute("FLUSH PRIVILEGES")

-- Closes cursor and database connection
cursor.close()
db.close()
