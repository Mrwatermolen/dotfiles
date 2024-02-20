return {
  {
    "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")

      -- TODO:(franzero) Add cond whether codelldb is installed
      -- Add a adapter
      local mason_registry = require("mason-registry")
      local codelldb = mason_registry.get_package("codelldb") -- note that this will error if you provide a non-existent package name
      local codelldb_dir = codelldb:get_install_path() -- returns a string like "/home/user/.local/share/nvim/mason/packages/codelldb"
      local codelldb_exe_path = codelldb_dir .. "/codelldb"
      dap.adapters.codelldb = {
        type = "server",
        port = "${port}",
        executable = {
          command = codelldb_exe_path,
          args = { "--port", "${port}" },
        },
      }

      -- Add a general configuration for cpp
      dap.configurations.cpp = {
        {
          name = "Launch specify file",
          type = "codelldb",
          request = "launch",
          program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
          end,
          cwd = "${workspaceFolder}",
          stopOnEntry = false,
        },
      }
    end,
  },
}
