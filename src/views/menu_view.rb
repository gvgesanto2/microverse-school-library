require_relative '../utils/console.utils'

class MenuView
  def initialize(options)
    @options = options.map.with_index do |option, index|
      "[#{index + 1}] #{option}."
    end
  end

  def show_options
    frame = gen_frame(@options, 5)
    puts frame
  end

  def get_user_option
    input = get_user_input('Please select a option number, then press [ENTER]: ').to_i
    if not_out_bounds?(input)
      input
    else
      puts 'Invalid option!'
      nil
    end
  end

  def not_out_bounds?(input)
    input.positive? && input <= @options.length
  end
end
