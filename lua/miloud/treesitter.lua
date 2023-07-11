local configs = require("nvim-treesitter.configs")
configs.setup {
  ensure_installed = { "c_sharp", "lua", "vim", "vimdoc", "javascript", "typescript", "html", "css", "sql", "json", "json5", "tsx", "yaml" },
  sync_install = false,
  ignore_install = { "" },
    highlight = {
    enable = true,
    disable = { "" },
    additional_vim_regex_highlighting = false,

  },
  incremental_selection = {
        enable = false,
    },
  indent = { enable = true },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
  rainbow = {
    enable = true,
    --disable = { "jsx", "cpp", "tsx" }, list of languages you want to disable the plugin for
    extended_mode = false, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  }
}
