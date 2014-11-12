# encoding: utf-8
require 'rails/generators/base'

module VjsRails
  module Generators
    class AssetsGenerator < ::Rails::Generators::Base
      source_root File.expand_path('../templates', __FILE__)
      desc File.read(File.expand_path('../USAGE', __FILE__))
      argument :file_name, type: :string, default: 'vjs'
      class_option :less, type: :boolean, default: false, desc: 'Create LESS file instead of CSS', aliases: '-l'

      def copy_vjs_css
        if options.less?
          copy_file 'vjs.less.erb', "app/assets/stylesheets/#{file_name}.less.erb"
        else
          copy_file 'vjs.css.erb', "app/assets/stylesheets/#{file_name}.css.erb"
        end
      end
    end
  end
end
