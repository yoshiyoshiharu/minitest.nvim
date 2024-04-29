lint:
	stylua --check .
	luacheck .

fix:
	stylua .
