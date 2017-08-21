class DataStore

  def initialize(file)
    @store = PStore.new(file)
  end

  def save(key, data)
    stored = retrieve(key, [])
    new = data.split(/[^[[:word:]]]+/)
    to_store = stored + new
    @store.transaction do
      @store[key] = to_store
      puts "[#{Time.now}]: New words added"
    end
  end

  def get(key)
    puts 'get'
    retrieve(key, nil)
  end

  def retrieve(key, default)
    @store.transaction { @store.fetch(key, default) }
  end

end


