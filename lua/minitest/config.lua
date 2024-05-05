local Config = {}

local default_config = {
  command = "rails test",
}

Config.config = {}

function Config.setup(user_config)
  user_config = user_config or {}
  Config.config = vim.tbl_deep_extend("force", default_config, user_config)
end

function Config.get(key)
  return Config.config[key]
end

return Config
