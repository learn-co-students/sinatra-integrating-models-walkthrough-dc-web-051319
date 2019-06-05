require_relative 'config/environment'
require_relative 'models/text_analyzer.rb'

class App < Sinatra::Base
  get '/' do
    erb :index
  end

  post '/' do
    @analyzed_text = TextAnalyzer.new(params[:user_text])
    @now = @analyzed_text.count_of_words
    @vowels = @analyzed_text.count_of_vowels
    @consonants = @analyzed_text.count_of_consonants
    @mul = @analyzed_text.most_used_letter
    # @times = params[:now]

    erb :results
  end
end
