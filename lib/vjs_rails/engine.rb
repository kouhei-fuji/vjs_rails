# encoding: utf-8
require 'vjs_rails/action_view/helpers'

module VjsRails
  class Engine < ::Rails::Engine
    initializer 'vjs_rails.action_view_helpers' do
      ActiveSupport.on_load :action_view do
        include VjsRails::ActionView::Helpers
      end
    end

  end
end
