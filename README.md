Erlang Experiments
==================

Exercise 1
----------

Write a module db.erl that creates a database and is able to store, retrieve and delete elements in
it. The function destroy/1 will delete the database. Considering that Erlang has garbage
collection, you do not need to do anything. Had the db module however stored everything on
file, you would delete the file. We are including the destroy function so as to make the interface
consistent. You may not use the lists library module, and have to implement all the recursive
functions yourself.

**Hint**: Use lists and tuples your main data structures. When testing your program, remember that
Erlang variables are single assignment.

### Interface:
    b:new() ⇒ Db.
    db:destroy(Db) ⇒ ok.
    db:write(Key, Element, Db) ⇒ NewDb.
    db:delete(Key, Db) ⇒ NewDb.
    db:read(Key, Db) ⇒{ok, Element} | {error, instance}.
    db:match(Element, Db) ⇒ [Key1, ..., KeyN].

### Example:
    f().
    %% ok
    c(db).
    %% {ok,db}
    Db = db:new().
    %% []
    Db1 = db:write(francesco, london, Db).
    %% [{francesco,london}]
    Db2 = db:write(lelle, stockholm, Db1).
    %% [{lelle,stockholm},{francesco,london}]
    db:read(francesco, Db2).
    %% {ok,london}
    Db3 = db:write(joern, stockholm, Db2).
    %% [{joern,stockholm},{lelle,stockholm},{francesco,london}]
    db:read(ola, Db3).
    %% {error,instance}
    db:match(stockholm, Db3).
    %% [joern,lelle]
    Db4 = db:delete(lelle, Db3).
    %% [{joern,stockholm},{francesco,london}]
    db:match(stockholm, Db4).
    %% [joern]

**Note**: Due to single assignment of variables in Erlang, we need to assign the updated database to
a new variable every time.