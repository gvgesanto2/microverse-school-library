def get_user_input(message)
  print message
  user_input = gets.chomp
  user_input
end

def bind_frame_up(frame, frame_to_bind)
  new_frame = frame.map(&:clone)
  new_frame_to_bind = frame_to_bind.map(&:clone)
  new_frame[0][0] = '╠'
  new_frame[0][-1] = '╣'
  new_frame_to_bind.delete_at(-1)

  new_frame_to_bind + new_frame
end

def bind_frame_down(frame, frame_to_bind)
  new_frame = frame.map(&:clone)
  new_frame_to_bind = frame_to_bind.map(&:clone)
  new_frame[-1][0] = '╠'
  new_frame[-1][-1] = '╣'
  new_frame_to_bind.delete_at(0)

  new_frame + new_frame_to_bind
end

def gen_frame(lines_to_print, padding)
  frame = []
  longest_line = lines_to_print.max { |a, b| a.length <=> b.length }
  border_top_str = '╔'
  border_bottom_str = '╚'
  border_width = longest_line.length + (padding * 2)

  border_width.times do
    border_top_str << '═'
    border_bottom_str << '═'
  end

  border_top_str << '╗'
  border_bottom_str << '╝'

  frame.push(border_top_str)

  lines_to_print.each do |line|
    content_left = '║' + (' ' * padding)
    content_right = (' ' * (padding + longest_line.length - line.length)) + '║'
    frame.push(content_left + line + content_right)
  end

  frame.push(border_bottom_str)
  frame
end

