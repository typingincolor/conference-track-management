# Talk List
class TalkList < Array
  def sort_desc!
    sort! { |x, y| y.length <=> x.length }
  end
end
