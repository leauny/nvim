LAZY_PLUGIN_SPEC = {}

function spec(item)
  -- require import to find lua file in lua/user
  table.insert(LAZY_PLUGIN_SPEC, { import = item })
end
