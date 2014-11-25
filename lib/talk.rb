# Talk
class Talk
  attr_reader :description
  attr_reader :length

  LIGHTNING_TALK_LENGTH = 5

  def initialize(talk)
    words = talk.split

    if words.last == 'lightning'
      @length = LIGHTNING_TALK_LENGTH
    elsif /(\d+)min/.match(words.last)
      @length = words.last.gsub('min', '').to_i
    else
      fail 'incorrect format'
    end

    @description = talk[/.*(?=\s)/]
  end

  def ==(that)
    return true if @length == that.length && @description == that.description

    false
  end
end
