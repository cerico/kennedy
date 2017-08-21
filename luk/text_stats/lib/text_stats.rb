require 'pstore'
require 'socket'
require 'optparse'
require 'daemons'

require 'text_stats/version'
require 'text_stats/client'
require 'text_stats/data_store'
require 'text_stats/server'
require 'text_stats/word_stats'

module TextStats
  options = {
    server: false,
    port: 5555,
    kill: false
  }
  OptionParser.new do |opts|
    opts.banner = "\nSimple word manipulator Ruby CLI app.\n"

    opts.on('-s', '--server', 'Run the server') do
      options[:server] = true
    end

    opts.on('-p', '--p', 'Set the server pr') do |p|
      options[:downcase] = p
    end

    opts.on('-k', '--kill', 'Stop running server') do
      options[:kill] = true
    end

    opts.on('-r', '--reverse', 'Reverse the order of letters') do |r|
      options[:reverse] = r
    end

    opts.on('-h', '--help', 'Displays help') do
      puts opts
      exit
    end
  end.parse!

  if options[:server]
    @server = Daemons.call do
      Server.new(options[:port], 'localhost')
    end
    puts "Running server on port #{options[:port]}"
  end
end
