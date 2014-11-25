# Talk
class Talk
  attr_reader :description
  attr_reader :length

  LIGHTNING_TALK_LENGTH = 5

  def initialize(talk)
    words = talk.split

    @description = talk[/.*(?=\s)/]

    if words.last == 'lightning'
      @length = LIGHTNING_TALK_LENGTH
    elsif /(\d+)min/.match(words.last)
      @length = /(\d+)min/.match(words.last).captures[0].to_i
    else
      fail 'incorrect format'
    end
  end
end
