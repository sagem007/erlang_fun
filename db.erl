-module(db).
-export([new/0, put/3, delete/2, get/2, find/2]).

new() -> [].

%delete(DK, L) -> [{K, V} || {K, V} <- L, K =/= DK].

put(K, V, L) -> 
    L1 = delete(K, L),
    [{K, V}|L1].

%get(_, []) -> {error, not_found};
%get(K, [{K, V}|_]) -> V;
%get(FK, [{_, _}|T]) -> get(FK, T).

%find(FV, L) -> [K || {K, V} <- L, V == FV].

delete(K, L) -> 
    lists:keydelete(K, 1, L).

get(K, L) ->
    case lists:keyfind(K, 1, L) of
		{_, Value} -> Value;
		_ -> {error, 'not_found'}
	end.

find(V, L) -> 
    lists:filter(fun({_, V1}) -> V =:= V1 end, L).