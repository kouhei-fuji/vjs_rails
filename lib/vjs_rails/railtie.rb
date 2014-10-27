# encoding: utf-8
require 'vjs_rails/action_view/helpers'

module VjsRails
  class Railtie < ::Rails::Railtie
    initializer 'vjs_rails.action_view_helpers' do |app|
      ActiveSupport.on_load :action_view do
        include VjsRails::ActionView::Helpers
      end
    end

  end
end
