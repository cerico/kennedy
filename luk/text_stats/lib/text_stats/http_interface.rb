require 'pstore'
require 'sinatra'
require 'json'

require 'text_stats/data_store'
require 'text_stats/word_stats'

enable :run

get '/stats' do
  stats = WordStats.new
  content_type :json
  stats.current.to_json
end