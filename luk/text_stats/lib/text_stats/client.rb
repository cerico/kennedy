class Client
  attr_accessor :id, :socket, :thread
  def initialize(id, socket, thread)
    @id = id
    @socket = socket
    @thread = thread
  end
end