class TrimmerDecorator
  def correct_name
    @nameable.correct_name.strip
  end
end