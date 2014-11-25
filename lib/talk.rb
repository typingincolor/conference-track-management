# Talk
class Talk
  attr_reader :description
  attr_reader :length

  def initialize(talk)
    words = talk.split

    @description = talk[/.*(?=\s)/]

    if words.last == 'lightning'
      @length = 5
    elsif /(\d+)min/.match(words.last)
      @length = /(\d+)min/.match(words.last).captures[0].to_i
    end
  end
end
