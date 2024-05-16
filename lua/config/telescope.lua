local telescope = require("telescope")
telescope.setup{
  defaults = {
    prompt_prefix = "🔍 " ,
    layout_config = {
      prompt_position = "top",
    },
  },
  pickers = {
    find_files = {
      theme = "ivy",
      file_ignore_patterns = { 'node_modules', '.git', '.venv' },
    },
    git_files = {
      prompt_prefix = "  ",
      theme = "dropdown",
    },
    grep_string = {
      prompt_prefix = "  ",
    }
  },
}
