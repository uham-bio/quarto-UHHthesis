-- remove-appendix-prefix.lua
-- Strips the word "Appendix" / "Anhang" from appendix section headers.
-- Quarto book projects prepend "Appendix A — ..." to appendix chapters;
-- this filter turns them into "A — ..." (letter + delimiter + title).

function Header(el)
  if el.level ~= 1 or #el.content == 0 then
    return nil
  end

  -- Check first inline for an appendix prefix word
  local first = el.content[1]
  if first.t ~= "Str" then
    return nil
  end

  if first.text ~= "Appendix" and first.text ~= "Anhang" then
    return nil
  end

  -- Remove the prefix word and the trailing space
  local new = pandoc.List({})
  local skip_next_space = true

  for i = 2, #el.content do
    local inline = el.content[i]
    if skip_next_space and inline.t == "Space" then
      skip_next_space = false
    else
      skip_next_space = false
      new:insert(inline)
    end
  end

  if #new > 0 then
    el.content = new
    return el
  end
end
