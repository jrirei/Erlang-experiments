%% ------------------------------------------------------------------
%% API Function Exports
%% ------------------------------------------------------------------
-module(db).

-export([new/0,
         destroy/1,
         write/3,
         read/2,
         match/2,
         delete/2]).
         
new() ->
  [].
  
destroy(_Db) ->
  ok.
  
write(Key, Element, Db) ->
  [{Key, Element}, Db].
  
read(Key, [[]]) ->
  {error, instance};
read(Key, [{K, E}|Db]) ->
  case Key of
    K -> {ok, E};
    _ -> read(Key, Db)
  end.

match(Element, Db) ->
  Key1 = 1,
  Key2 = 2,
  KeyN = n,
  [Key1, Key2, KeyN].

delete(Key, Db) ->
  NewDb = 1,
  NewDb.
