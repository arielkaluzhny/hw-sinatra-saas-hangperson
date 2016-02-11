class HangpersonGame

  # add the necessary class methods, attributes, etc. here
  # to make the tests in spec/hangperson_game_spec.rb pass.

  # Get a word from remote "random word" service

  # def initialize()
  # end
  attr_accessor :word
  attr_accessor :guesses
  attr_accessor :wrong_guesses
  def initialize(word)
    @word = word
    @guesses = ''
    @wrong_guesses = ''
  end

  def guess(letter)
    if (/[a-zA-Z]/ =~ letter) ==0
      letter.downcase!# letter guessing should not be case sensitive
      if guesses.count(letter) < 1
        if word.count(letter) >= 1
          @guesses = "#{guesses}#{letter.to_s}"
          return true
        else
          if wrong_guesses.count(letter) < 1
            @wrong_guesses = "#{wrong_guesses}#{letter.to_s}"
          end
          return false
        end
      else
        return false
      end
    else
      raise ArgumentError
    end
  end
  
  def self.get_random_word
    require 'uri'
    require 'net/http'
    uri = URI('http://watchout4snakes.com/wo4snakes/Random/RandomWord')
    Net::HTTP.post_form(uri ,{}).body
  end
end
