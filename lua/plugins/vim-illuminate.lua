return {
  "RRethy/vim-illuminate",
  lazy = false,
  -- Need to specify this because vim-illuminate uses a non-standard
  -- entrypoint: configure() instead of setup().
  config = function()
    require("illuminate").configure({})
  end,
}
