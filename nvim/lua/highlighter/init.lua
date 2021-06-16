local ts_config = require("nvim-treesitter.configs")

ts_config.setup {
    ensure_installed = {
        "javascript",
        "typescript",
        "html",
        "css",
        "bash",
        "cpp",
        "rust",
        "json",
        "go",
        "lua",
        "php"
    },
    highlight = {
        enable = true,
        use_languagetree = true
    },
  	incremental_selection = {
			enable = true,
			keymaps = {
					init_selection = "gnn",
					node_incremental = "grn",
					scope_incremental = "grc",
					node_decremental = "grm",
			},
		},
		indent = {
			enable = true,
		},
}

-- vim.api.nvim_exec([[
-- set foldmethod=expr
-- set foldexpr=nvim_treesitter#foldexpr()
-- ]], '')
