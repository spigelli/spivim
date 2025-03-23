return {
  -- lspconfig
  {
    "neovim/nvim-lspconfig",
    event = "BufReadPre",
    dependencies = {
      "mason.nvim",
      { "williamboman/mason-lspconfig.nvim", config = function() end },
    },
    config = function()
      -- LSP configuration options
      local diagnostic_config = {
        underline = true,
        update_in_insert = false,
        virtual_text = {
          spacing = 4,
          source = "if_many",
          prefix = function(diagnostic)
            local severity_map = {
              [vim.diagnostic.severity.ERROR] = "E",
              [vim.diagnostic.severity.WARN] = "W",
              [vim.diagnostic.severity.HINT] = "H",
              [vim.diagnostic.severity.INFO] = "I",
            }
            return severity_map[diagnostic.severity]
          end,
        },
        severity_sort = true,
      }

      -- Setup inlay hints
      local inlay_hints_enabled = false
      local inlay_hints_exclude = { "vue" }

      vim.diagnostic.config(diagnostic_config)

      -- LSP on_attach without keybinds
      local function on_attach(client, bufnr)
        -- Enable inlay hints
        if inlay_hints_enabled and client.supports_method("textDocument/inlayHint") then
          if vim.api.nvim_buf_is_valid(bufnr) and vim.bo[bufnr].buftype == "" 
            and not vim.tbl_contains(inlay_hints_exclude, vim.bo[bufnr].filetype) then
            vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
          end
        end
      end

      -- Configure capabilities
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      
      -- Add cmp_nvim_lsp capabilities if available
      local has_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
      if has_cmp then
        capabilities = vim.tbl_deep_extend("force", capabilities, cmp_nvim_lsp.default_capabilities())
      end
      
      -- Add workspace capabilities
      capabilities.workspace = {
        fileOperations = {
          didRename = true,
          willRename = true,
        },
      }

      -- Server configurations
      local servers = {
        lua_ls = {
          settings = {
            Lua = {
              workspace = {
                checkThirdParty = false,
              },
              codeLens = {
                enable = true,
              },
              completion = {
                callSnippet = "Replace",
              },
              doc = {
                privateName = { "^_" },
              },
              hint = {
                enable = true,
                setType = false,
                paramType = true,
                paramName = "Disable",
                semicolon = "Disable",
                arrayIndex = "Disable",
              },
            },
          },
        },
        -- Add other servers as needed
      }

      -- Setup each server
      local function setup_server(server_name)
        local server_opts = servers[server_name] or {}
        server_opts.capabilities = capabilities
        server_opts.on_attach = on_attach
        
        require("lspconfig")[server_name].setup(server_opts)
      end

      -- Get all servers available through mason-lspconfig
      local have_mason, mlsp = pcall(require, "mason-lspconfig")
      local ensure_installed = {}
      
      if have_mason then
        local all_mslp_servers = vim.tbl_keys(require("mason-lspconfig.mappings.server").lspconfig_to_package)
        
        -- Determine which servers to install with mason
        for server, server_opts in pairs(servers) do
          if server_opts and server_opts.mason ~= false and vim.tbl_contains(all_mslp_servers, server) then
            ensure_installed[#ensure_installed + 1] = server
          else
            -- Manual setup for servers not managed by mason
            setup_server(server)
          end
        end
        
        -- Configure mason-lspconfig
        mlsp.setup({
          ensure_installed = ensure_installed,
          handlers = { setup_server },
        })
      else
        -- Fallback if mason isn't available
        for server, _ in pairs(servers) do
          setup_server(server)
        end
      end
    end,
  },

  -- mason for installing external tools
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
    -- build = ":MasonUpdate",
    opts = {
      ensure_installed = {
        "stylua",
        "shfmt",
      },
    },
    config = function(_, opts)
      require("mason").setup(opts)
      
      -- Install specified tools
      local mr = require("mason-registry")
      mr:on("package:install:success", function()
        vim.defer_fn(function()
          vim.cmd("doautocmd FileType")
        end, 100)
      end)

      mr.refresh(function()
        for _, tool in ipairs(opts.ensure_installed or {}) do
          local p = mr.get_package(tool)
          if not p:is_installed() then
            p:install()
          end
        end
      end)
    end,
  },
}
