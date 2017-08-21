class WordStats
  attr_reader :store

  def initialize
    @store = DataStore.new('text_stats.pstore')
  end

  def current
    words = store.retrieve(:words, nil)
    {
        count: words.count,
        top_5_words: top_5_words(words),
        top_5_letters: top_5_letters(words)
    }
  end

  private

  def top_5_letters(words)
    letters = words.join(',').scan /\w/
    top_5(list_with_count(letters))
  end

  def top_5_words(words)
    top_5(list_with_count(words))
  end

  def list_with_count(list)
    list.each_with_object(Hash.new(0)) { |letter, hash| hash[letter] += 1 }
  end

  def top_5(list)
    list.sort_by { |_k, v| -v }
        .first(5)
        .map(&:first)
        .flatten
  end
end
