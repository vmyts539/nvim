-- return {
--   "olimorris/codecompanion.nvim",
--   dependencies = {
--     "nvim-lua/plenary.nvim", -- Required dependency
--     "nvim-treesitter/nvim-treesitter", -- Required for some features
--   },
--   opts = {
--     -- Define your Ollama adapter
--     adapters = {
--       ollama = function()
--         return require("codecompanion.adapters").extend("ollama", {
--           -- 'ollama' is the base adapter provided by CodeCompanion for Ollama
--           name = "ollama", -- You can name it anything you like, but 'ollama' is standard for the default
--           -- env = {
--           --   url = "http://localhost:11434", -- Default Ollama API URL. Change if yours is different.
--           -- },
--           schema = {
--             model = {
--               default = "qwen2.5-coder", -- Replace with the specific Ollama model you want to use
--               -- You can also fetch available models dynamically if needed:
--               -- choices = function()
--               --   local curl = require('plenary.curl')
--               --   local response = curl.get('http://localhost:11434/api/tags', { sync = true })
--               --   if not response then return {} end
--               --   local ok, json = pcall(vim.json.decode, response.body)
--               --   if not ok then return {} end
--               --   local models = {}
--               --   for _, model_data in ipairs(json.models) do
--               --     table.insert(models, model_data.name)
--               --   end
--               --   return models
--               -- end,
--             },
--             num_ctx = {
--               default = 16384, -- Context window for your model (adjust based on your model's capabilities)
--             },
--             num_predict = {
--               default = -1, -- -1 means predict until stop token
--             },
--           },
--         })
--       end,
--       -- You can define other adapters here if you use multiple LLMs
--     },
--     -- Set Ollama as the default adapter for chat, inline, and cmd operations
--     strategies = {
--       chat = {
--         adapter = "ollama",
--       },
--       inline = {
--         adapter = "ollama",
--       },
--       cmd = {
--         adapter = "ollama",
--       },
--     },
--     -- Optional: Enable debug logging for troubleshooting
--     -- opts = {
--     --   log_level = 'DEBUG',
--     -- },
--     -- Optional: Configure display options
--     display = {
--       diff = {
--         enabled = true,
--         layout = "vertical", -- or 'horizontal'
--       },
--     },
--   },
-- }

return {
  "greggh/claude-code.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim", -- Required for git operations
  },
  config = function()
    require("claude-code").setup({
      window = {
        -- split_ratio = 0.8,
        position = "float",
        enter_insert = true, -- Whether to enter insert mode when opening Claude Code

        float = {
          width = "90%", -- Width: number of columns or percentage string
          height = "90%", -- Height: number of rows or percentage string
          row = "center", -- Row position: number, "center", or percentage string
          col = "center", -- Column position: number, "center", or percentage string
          relative = "editor", -- Relative to: "editor" or "cursor"
          border = "rounded", -- Border style: "none", "single", "double", "rounded", "solid", "shadow"
        },
      },

      refresh = {
        enable = true, -- Enable file change detection
        updatetime = 100, -- updatetime when Claude Code is active (milliseconds)
        timer_interval = 1000, -- How often to check for file changes (milliseconds)
        show_notifications = true, -- Show notification when files are reloaded
      },

      git = {
        use_git_root = true, -- Set CWD to git root when opening Claude Code (if in git project)
      },

      shell = {
        separator = "&&", -- Command separator used in shell commands
        pushd_cmd = "pushd", -- Command to push directory onto stack (e.g., 'pushd' for bash/zsh, 'enter' for nushell)
        popd_cmd = "popd", -- Command to pop directory from stack (e.g., 'popd' for bash/zsh, 'exit' for nushell)
      },

      command = "claude", -- Command used to launch Claude Code
      command_variants = {
        -- Conversation management
        continue = "--continue", -- Resume the most recent conversation
        resume = "--resume", -- Display an interactive conversation picker

        -- Output options
        verbose = "--verbose", -- Enable verbose logging with full turn-by-turn output
      },

      -- Keymaps
      keymaps = {
        toggle = {
          normal = "<C-,>", -- Normal mode keymap for toggling Claude Code, false to disable
          terminal = "<C-,>", -- Terminal mode keymap for toggling Claude Code, false to disable
          variants = {
            continue = "<leader>cC", -- Normal mode keymap for Claude Code with continue flag
            verbose = "<leader>cV", -- Normal mode keymap for Claude Code with verbose flag
          },
        },
        window_navigation = true, -- Enable window navigation keymaps (<C-h/j/k/l>)
        scrolling = true, -- Enable scrolling keymaps (<C-f/b>) for page up/down
      },
    })
  end,
}
