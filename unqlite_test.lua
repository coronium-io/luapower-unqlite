---
--= unqlite binding for embedded keystore
--= http://unqlite.org/
---
local unqlite = require( 'unqlite' )

--== In memory, cleared on app shutdown.
local db = unqlite.open()
db:set( "dog", "woof" )
print( db:get( "dog" ) )
--> woof

db:close() --close it when your done.

--== File based, will live outside the app.
local db2 = unqlite.open('users.db')
db2:set( "user", "Alex" )
local username = db2:get( "user" )

--== Multi database (db2 has not been closed)
local db = unqlite.open('config.db')
db:set( "username", username )

--== Close up
db:close()
db2:close()

print( 'OK' )
