# encoding: utf-8

module VjsRails
  module ActionView
    module Helpers
      def render_video_for_vjs *options
        default_data_setup = { preload: 'none', controls: true }
        options = options.extract_options!
        data_setup = options.slice!(:id, :class, :sources, :captions).reverse_merge(default_data_setup)
        content_for(:vjs_rails) { block_given? ? yield : "To view this video please enable JavaScript, and consider upgrading to a web browser that <a href='http://videojs.com/html5-video-support/' target='_blank'>supports HTML5 video</a>".html_safe } unless content_for?(:vjs_rails)
        render partial: 'vjs_rails/vjs_rails', locals: { options: options, data_setup: data_setup.to_json }
      end

    end
  end
end
