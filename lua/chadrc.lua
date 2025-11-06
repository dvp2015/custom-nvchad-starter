--@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "onedark",

	-- hl_add = require "hl",
	--  integrations = { "markview" },

  -- hl_override = {
	-- 	Comment = { italic = true },
	-- 	["@comment"] = { italic = true },
	-- },
}

M.nvdash = {
  load_on_startup = true,

  header = {
    "░░░░░░░░░░░▄██",
    "░░░░░░░░░▄████",
    "░░░░░░░▄██████",
    "░▄██▄▄███▀░██ ",
    "████████▀░░█  ",
  },
}

M.ui = {
      tabufline = {
      lazyload = false
   }
}

M.term = {
  base46_colors = true,
}

return M
