# loader.rb
def loading_animation(seconds)
  print "\e[1;32mLoading\e[0m"
  seconds.times do
    sleep(1)
    print "\e[1;32m<*>\e[0m"
    $stdout.flush
  end
end

loading_thread = Thread.new { loading_animation(5) }

load 'main.rb'

Thread.new do
  sleep(1)
  Process.kill('USR1', Process.pid)
end

loading_thread.join
