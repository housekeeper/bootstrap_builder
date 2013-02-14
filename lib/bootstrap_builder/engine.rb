require "bootstrap_builder"
require "rails"

module BootstrapBuilder
  class Engine < Rails::Engine
    engine_name 'BootstrapBuilder'
    isolate_namespace BootstrapBuilder

    initializer 'helper' do |app|
      ActionView::Base.send(:include, BootstrapBuilder::Helper)
      
      # Remove field_with_errors div around elements with errors
      ActionView::Base.field_error_proc = proc { |input, instance| input }
    end
  end
end