%% Author: uabjle
%% Created: 10 dec 2012
%% Description: TODO: Add description to application_org
-module(nodelog).

%% --------------------------------------------------------------------
%% Include files
%% --------------------------------------------------------------------
-define(SERVER,nodelog_server).
%% --------------------------------------------------------------------
%% Internal exports
%% --------------------------------------------------------------------
-export([
	 read/1,
	 log/4,
	 create/1,
	 ping/0

	]).


%% --------------------------------------------------------------------
%% Macros
%% --------------------------------------------------------------------

%% --------------------------------------------------------------------
%% Records
%% --------------------------------------------------------------------

%% --------------------------------------------------------------------
%% API Functions
%% --------------------------------------------------------------------
%%---------------------------------------------------------------
%% Function:all_specs()
%% @doc: all service specs infromation       
%% @param: non 
%% @returns:State#state.service_specs_info
%%
%%---------------------------------------------------------------
read(LogLevel)->
    gen_server:call(?SERVER, {read,LogLevel},infinity).


create(LogFile)->
    gen_server:call(?SERVER, {create,LogFile},infinity).


log(Level,ModuleString,Line,Msg)-> 
    gen_server:cast(?SERVER, {log,Level,ModuleString,Line,Msg}).

%% 
%% @doc:check if service is running
%% @param: non
%% @returns:{pong,node,module}|{badrpc,Reason}
%%
-spec ping()-> {atom(),node(),module()}|{atom(),term()}.
ping()-> 
    gen_server:call(?SERVER, {ping},infinity).

%% ====================================================================!
%% External functions
%% ====================================================================!


%% ====================================================================
%% Internal functions
%% ====================================================================
