# Luapower UnQLite Lua API

## Storage Types

When working with a unqlite datastore, you can choose between either an *"in-memory"* store, which will remain as long as the application is running, or a *file based* store, which will remain along side your __Luapower__ application (or wherever you put it) and can be backed-up, swapped out, etc. even after the application has closed.

## Opening Connections

Opening a new datastore is simple. You can also pass a `mode` as the second parameter to the *File Based* opener.

### File based modes

* `readonly`
* `readwrite`
* `create`
* `memory`
* `mmap`

__File Based:__

```lua
local uql = require('unqlite')

local db = uql:open('file.db', 'readwrite')
--== Do stuff
db:close()
```

> Any data stored during runtime will persist in the `file.db` which should end up inside your application directory. Provide a path to place it elsewhere.

__Memory Based:__

```lua
local uql = require('unqlite')

local db = uql:open()
--== Do stuff
db:close()
```

> Any data stored during runtime will be lost once the application quits.

### Closing a Database

Be sure to close the datastore connection when you are finished:

```lua
db:close()
```

## Keys and Values

The following cover dealing with keys in the datastore.

### Setting Keys

To set a key with a data value:

```lua
db:set("key_str", "key_str_value")
```

### Getting Values

To get the value back from a key:

```lua
local val = db:get("key_str")
```

### Appending Values

To append values to an existing key:

```lua
db:append("existing_key", "append_value")
```

### Deleting Keys

To delete a key, and its associated data:

```lua
db:delete("key_str")
```

## Transactions

### Starting a Transaction

```lua
db:begin()
```

### Commiting a Transaction

```lua
db:commit()
```

### Rolling Back a Transaction

```lua
db:rollback()
```

## Cursors

Cursors allow you to move through result sets quickly and easily.

### Get a New Cursor

```lua
local db_cursor = db:cursor()
```

### Go to First Entry

```lua
db_cursor:first()
```

### Go to Next Entry

```lua
db_cursor:next_entry()
```

### cursor:key ?

```lua
db_cursor:key()
```

### cursor:data ?

```lua
db_cursor:data()
```

### Release the Cursor

```lua
db:release()
```

### Multiple Instances

You can have more than one unqlite instance running:

```lua
local db1 = unqlite:open() --in memory
local db2 = unqlite:open("file.db") --as file
local db3 = unqlite:open("file2.db") --as file

db1:set("username", db2:get("username"))

db3:set("last-login", tostring(os.time()))

db2:close()
db3:close()
```

Both database `db2` and `db3` will store any data in the `file.db` and `file2.db` files respectively. These files are stored relative to the application.

## Portability

The UnQLite file format is portable and can be opened by other applications implementing the unqlite lib.
