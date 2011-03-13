# gem install irbtools
# gem install irb_rocket --source http://merbi.st

require 'irbtools'

# quick benchmarking
# http://stackoverflow.com/questions/123494/whats-your-favourite-irb-trick/123834#123834
def bench(reps = 100, &block)
  require 'benchmark'
  Benchmark.bmbm do |b|
    b.report{ reps.times(&block) }
  end
  nil
end

# Enable lambda prompts. http://twitter.com/acetoxy/status/26734736005
class IRB::Irb
  alias :original_prompt :prompt

  def prompt(prompt, ltype, indent, line_no)
    prompt = prompt.call if prompt.respond_to?(:call)
    original_prompt(prompt, ltype, indent, line_no)
  end
end

def rails_console?
  ($0 == 'irb' && ENV['RAILS_ENV']) ||  # Rails 2.
  $0 == 'script/rails'  # Rails 3.
end

# E.g.:
# 12:23:15 >>
# DEV 12:23:15 >>
# https://github.com/henrik/dotfiles/blob/master/irbrc
IRB.conf[:PROMPT][:SIMPLE].merge!(:PROMPT_I => lambda {
  "#{[ (rails_console? ? Rails.env.first(3).upcase : nil), Time.now.strftime("%H:%M:%S") ].compact.join(' ')} >> "
})
IRB.conf[:PROMPT_MODE] = :SIMPLE

# https://gist.github.com/807492
class Array
  def self.toy(n=10,&block)
    block_given? ? Array.new(n,&block) : Array.new(n) {|i| i+1}
  end
end
class Hash
  def self.toy(n=10)
    Hash[Array.toy(n).zip(Array.toy(n){|c| (96+(c+1)).chr})]
  end
end
