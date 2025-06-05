require "rails/railtie"

module Railsglyphs
  class Railtie < Rails::Railtie
    initializer "railsglyphs.helpers" do
      ActiveSupport.on_load(:action_view) do
        include Railsglyphs::IconHelper
      end
    end
  end
end
