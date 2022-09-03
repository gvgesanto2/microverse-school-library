require_relative './controllers/app_controller'

def main
  app = AppController.new
  app.run
end

main
