function WrapConsoleLogWithIndent()
  -- Save the original cursor position
  local orig_pos = vim.api.nvim_win_get_cursor(0)
  local line_num = orig_pos[1]

  -- Get the positions of the start and end of the visual selection
  local start_pos = vim.api.nvim_buf_get_mark(0, "<")
  local end_pos = vim.api.nvim_buf_get_mark(0, ">")

  -- Calculate the range
  local range = { start_pos[1], start_pos[2] + 1, end_pos[1], end_pos[2] + 1 }

  -- Get the text of the visual selection
  local lines = vim.api.nvim_buf_get_text(0, range[1] - 1, range[2] - 1, range[3] - 1, range[4], {})

  -- Assuming single-line selection for simplicity, join lines if necessary
  local text = table.concat(lines, " ")

  -- Get the current line's indentation
  local indent = vim.fn.indent(line_num)

  -- Create the console.log string with the same indentation
  local indentString = string.rep(" ", indent)
  local consoleLogText = indentString .. "console.log(" .. text .. ");"

  -- Insert the console.log statement in a new line below the current line
  vim.api.nvim_buf_set_lines(0, line_num, line_num, false, { consoleLogText })

  -- Restore the original cursor position
  vim.api.nvim_win_set_cursor(0, orig_pos)
end

-- Assign the function to a global variable so you can call it from a key mapping
_G.WrapConsoleLogWithIndent = WrapConsoleLogWithIndent
