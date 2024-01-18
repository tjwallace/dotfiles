#!/usr/bin/env ruby

IRB.conf[:AUTO_INDENT] = true

require 'irb/completion'

require 'irb/ext/save-history'
IRB.conf[:SAVE_HISTORY] = 10_000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-history"

[
  'irbtools',
  'active_support/all'
].each do |library|
  begin
    require library
  rescue LoadError
    puts "* Unable to load #{library}"
  end
end

Time.zone = 'America/Vancouver' if Time.respond_to?(:zone=)

# Enable lambda prompts. http://twitter.com/acetoxy/status/26734736005
class IRB::Irb
  alias original_prompt prompt

  def prompt(prompt, ltype, indent, line_no)
    prompt = prompt.call if prompt.respond_to?(:call)
    original_prompt(prompt, ltype, indent, line_no)
  end
end

def rails_console?
  $PROGRAM_NAME == 'rails_console'
end

# E.g.:
# 12:23:15 >>
# DEV 12:23:15 >>
# https://github.com/henrik/dotfiles/blob/master/irbrc
IRB.conf[:PROMPT][:SIMPLE][:PROMPT_I] = lambda {
  [
    (rails_console? ? Rails.env.first(3).upcase : nil),
    Time.now.strftime('%H:%M:%S'),
    '>> '
  ].compact.join(' ')
}
IRB.conf[:PROMPT_MODE] = :SIMPLE
