require("notify").setup({
  stages = "fade_in_slide_out",
  background_colour = "#1a1b26",
  minimum_width = 50,
  maximum_width = 50,
  minimum_height = 10,
  maximum_height = 10,
  text_align = "left",
  timeout = 5000,
  icons = {
    ERROR = " ",
    WARN = " ",
    INFO = " ",
    DEBUG = " ",
    TRACE = " ",
  },
})

