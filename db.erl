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
  [{Key, Element} | Db].
  
read(_, []) ->
  {error,instance};
read(Key, [{K, E} | Db]) ->
  case Key of
    K -> {ok, E};
    _ -> read(Key, Db)
  end.

match(Element, Db) -> match(Element, [], Db).

match(_, Acc, []) -> Acc;
match(Element, Acc, [{K, E} | Db]) ->
  case Element of
    E -> match(Element, [K | Acc], Db);
    _ -> match(Element, Acc, Db)
  end.

delete(Key, Db) -> delete(Key, [], Db).

delete(_, Acc, []) -> reverse(Acc);
delete(Key, Acc, [{K, E} | Db]) ->
  case Key of
    K -> delete(Key, Acc, Db);
    _ -> delete(Key, [{K, E} | Acc], Db)
  end.

reverse(Arr) -> reverse(Arr, []).

reverse([], Acc) -> Acc;
reverse([H | T], Acc) ->
  reverse(T, [H | Acc]).
  