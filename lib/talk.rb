# Talk
class Talk
  attr_reader :description
  attr_reader :length

  def initialize(talk)
    matches = /(\d+)min/.match(talk)

    if matches.nil?
      @length = 5 if talk.split.last == 'lightning'
    else
      @length = matches.captures[0].to_i
    end

    @description = talk[/.*(?=\s)/]
  end
end
