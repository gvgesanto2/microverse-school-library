require_relative './component'

class BookComponent < Component
  def to_string
    "ID: #{@data.id} | Title: #{@data.title} | Author: #{@data.author}"
  end
end
