return {
  {
    "ldelossa/nvim-dap-projects",
    config = function()
      -- By default the paths ./nvim-dap.lua, ./.nvim-dap/nvim-dap.lua and .nvim/nvim-dap.lua
      require("nvim-dap-projects").search_project_config()
    end,
  },
}
