# Luapower UnQLite Lua API

When opening a new unqlite data store, you can choose between either an "in-memory" store, which will only remain as long as the application is running.

Your other option is a file based store. This will remain along side your __Luapower__ application (or wherever you put it) and can be backed-up, swapped out, etc.

### Opening a data connection

You can have multiple unqlite data stores open, but let's start with a single instance.

__Memory Based:__

```lua
local uql = require('unqlite')
local db = uql:open()
--== Do stuff
db:close()
```

> Any data stored during runtime will be lost once the application quits.

__File Based:__

```lua
local uql = require('unqlite')
local db = uql:open('file.db')
--== Do stuff
db:close()
```

> Any data stored during runtime will persist in the `file.db` which should end up inside your application directory. Provide a path to place it elsewhere.

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

### Multiple instances

You can have more than one unqlite instance running:

```lua
local db1 = unqlite:open() --in memory
local db2 = unqlite:open("file.db") --as file

db1:set("username", db2:get("username"))

db1:close()
db2:close()
```
