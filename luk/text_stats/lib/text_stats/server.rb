ARGV.each do |arg|
  puts arg
end

class Server
  attr_reader :store

  def initialize(port, ip)
    @server = TCPServer.open(ip, port)
    @port = port
    @clients = []
    @users_mutex = Mutex.new
    @store = DataStore.new('text_stats.pstore')
    run
  end

  def run
    puts "[#{Time.now}]: Server started...\nListening on port #{@port}\n"
    loop do
      Thread.start(@server.accept) do |client|
        client.puts 'Welcome to Text Stats!'
        id = Time.now.to_i
        u = Client.new(id, client, Thread.current)
        @users_mutex.synchronize do
          @clients.each do |us|
            if us.id == id
              client.puts 'ID already taken.'
              client.close
            end
          end
          @clients << u
          client.puts "Your ID #{id}"
          puts "[#{Time.now}]: Client #{id} connected..."
        end
        loop do
          client.write 'Enter text: '
          text = client.readline.chomp.downcase
          store.save(:words, text)
          next unless text == 'quit' || text == 'q'
          @users_mutex.synchronize do
            @clients -= [u]
          end
          client.close
          puts "[#{Time.now}]: #{id} disconnected"
          @users_mutex.synchronize do
            @clients.each do |us|
              us.socket.write 'Enter text: '
            end
          end
          Thread.kill(Thread.current)
        end
      end
    end
  end
end
