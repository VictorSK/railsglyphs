require "rails/railtie"

module RailsGlyphs
  class Railtie < Rails::Railtie
    initializer "railsglyphs.helpers" do
      ActiveSupport.on_load(:action_view) do
        include RailsGlyphs::IconHelper
      end
    end
  end
end
