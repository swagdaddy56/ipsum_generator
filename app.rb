require 'sinatra'
require 'dinosaurus'

Dinosaurus.configure do |config|
  config.api_key = '9fb9156eefee8f66d8d35da03e4f41f1'
end

get '/swag' do
  redirect 'page.html'
end


post '/send' do
  @content = []
  @word = params['word']
  @numb = params['num']
  @results = Dinosaurus.lookup(@word)
  @syn = Dinosaurus.synonyms_of(@word)
  @ant = Dinosaurus.antonyms_of(@word)
  @rel = Dinosaurus.related_to(@word)
  @sim = Dinosaurus.similar_to(@word)
  @total_words = @numb.to_f * 250
  @trill = ["You are now listening to an OG Bobby Johnson Beat", "Bank of America account got six figures", "swagdaddy56", "Garber is sick", "AND 1!"]



  @results.each do |i_key, x|
    @results[i_key].each do |j_key, y|
      @results[i_key][j_key].each do |word|
        @content << word
      end
    end
  end
@all_words = []
@numb.to_i.times do
  @all_sentences = []
  (7).times do
    @sentence = []
    10.times do
      @sentence << @content.sample
    end
    @all_sentences << @sentence
  end
  @all_words << @all_sentences
end
=begin
  @all_words.each do |x|
    @swag = []
   @swag << x.insert(" ")
  end
=end

=begin
  i = 0
  while i < @results['noun']['syn'].length
    @content << @results['noun']['syn'][i]
    i+=1
  end
=end
 # while i < @results['verb']['syn'].length
   # @content << @results['verb']['syn'][i]
   # i+=1
  #end




  erb :my_view
end



