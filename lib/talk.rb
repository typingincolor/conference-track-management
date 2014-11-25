# Talk
class Talk
  attr_reader :description
  attr_reader :length

  def initialize(talk)
    @length = /(\d+)min/.match(talk).captures[0].to_i
    @description = talk[/.*(?=\s)/]
  end
end
