# The windows cmd.exe cannot handle utf-8 by default because it is set to a locale-specific codepage.
# This can be fixed by using CP65001 (which is Microsoft's name for utf-8) while pry is running.
#
# Unfortunately using CP65001 has a nasty bug whereby you can't run ruby programs from the shell, so
# we need to undo our change as ruby exits.
Pry.hooks.add_hook :before_session, :hack_utf8 do |*|
  previous_codepage = `chcp`.scan(/[0-9]+/).first
  `chcp 65001`
  at_exit{ `chcp #{previous_codepage}` }
end

# For some reason `Readline.readline` always returns strings with #<Encoding:ASCII-8BIT>,
# let's just change that to utf-8 so that everything works more as expected:
#
# before this change:
#   [1] pry(main)> "\xC3\xB7".encoding
#   => #<Encoding:ASCII-8BIT>
#
# after:
#   [2] pry(main)> "\xC3\xB7".encoding
#   => #<Encoding:UTF-8>
#
Pry.hooks.add_hook :after_read, :hack_utf8 do |str, _|
  str.force_encoding('utf-8')
end
