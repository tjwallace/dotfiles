#!/usr/bin/env ruby

IRB.conf[:AUTO_INDENT] = true

require 'irb/completion'

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
