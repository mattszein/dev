-- lazy.nvim
return {
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        sources = {
          explorer = {
            win = {
              input = {
                keys = {
                  ["<M-t>"] = { "tab", mode = { "i", "n" } },
                },
              },
              list = {
                keys = {
                  ["<M-t>"] = "tab",
                },
              },
            },
          },
        },
      },
    },
    keys = {
      {
        "<leader>fC",
        function()
          Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
        end,
        desc = "Find Config File",
      },
      {
        "<leader>fc",
        function()
          Snacks.picker.files({ cwd = "~/.config", hidden = true })
        end,
        desc = "Find Config File",
      },
    },
  },
}
