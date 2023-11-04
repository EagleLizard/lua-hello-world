LUAROCKS_PATH = $(shell luarocks path --lr-path)
LUAROCKS_CPATH = $(shell luarocks path --lr-cpath)

run:
	@LUA_PATH="$(LUAROCKS_PATH)" LUA_CPATH="$(LUAROCKS_CPATH)" lua init.lua
