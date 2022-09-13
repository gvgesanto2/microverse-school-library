require_relative '../components/menu_component'

class MenuManager
  def initialize(options)
    @options = options
  end

  def handle_show_menu
    options_titles = @options.map { |option| option[:title] }
    menu_component = MenuComponent.new(options_titles)
    menu_component.render
    user_option = menu_component.get_user_option

    @options[user_option - 1][:handler].call if user_option
  end
end
