return {
  "mfussenegger/nvim-dap",
  optional = true,
  opts = function()
    local dap = require("dap")
    -- local path = require("mason-registry").get_package("php-debug-adapter"):get_install_path()
    dap.adapters.php = {
      type = "executable",
      command = "node",
      -- args = { path .. "/extension/out/phpDebug.js" },
      args = { "/Users/fran/code/chipax_src/vscode-php-debug/out/phpDebug.js" },
    }
    dap.configurations.php = {
      {
        type = "php",
        request = "launch",
        name = "Xdebug in Chipax Container",
        port = 9000,
        pathMappings = {
          -- Map Docker container path to local path
          ["/var/www/html"] = "${workspaceFolder}",
        },
      },
    }
  end,
}
