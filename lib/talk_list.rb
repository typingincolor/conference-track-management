# Talk List
class TalkList < Array
  def initialize(filename = '')
    File.readlines(filename).each do |line|
      push Talk.new(remove_newline line)
    end unless filename == ''
  end

  def remove_newline(str)
    str.gsub(/\n/, '')
  end

  private :remove_newline
end
