# encoding: utf-8
require 'rails_helper'

RSpec.describe VjsRails::ActionView::Helpers, type: :helper do
  describe '#render_video_for_vjs' do
    context 'when there are no options (default)' do
      it 'render video tag with default id, class, data-setup' do
        expect(helper.render_video_for_vjs).to have_tag 'video.video-js.vjs-default-skin', with: { id: '', :class => ['video-js', 'vjs-default-skin'], 'data-setup' => { preload: 'none', controls: true }.to_json }
      end
      it 'render p tag with class vjs-no-js' do
        expect(helper.render_video_for_vjs).to have_tag 'video.video-js.vjs-default-skin' do
          with_tag 'p.vjs-no-js', count: 1, text: /To view this video please enable JavaScript/
        end
      end
    end

    context 'when there are id option' do
      it 'render video tag with id' do
        options = { id: 'my_video' }
        expect(helper.render_video_for_vjs(options)).to have_tag 'video', with: { id: 'my_video' }
      end
    end

    context 'when there are class option' do
      it 'render video tag with class' do
        options = { class: 'my_video_class' }
        expect(helper.render_video_for_vjs(options)).to have_tag 'video', with: { :class => ['my_video_class', 'video-js', 'vjs-default-skin'] }
      end
    end

    context 'when there are sources' do
      it 'render source tag' do
        options = { sources: { :'video/mp4' => 'http://example.com/video.mp4' } }
        expect(helper.render_video_for_vjs(options)).to have_tag 'video.video-js.vjs-default-skin' do
          with_tag 'source', count: 1, with: { src: 'http://example.com/video.mp4', type: 'video/mp4' }
        end
      end
    end

    context 'when there are captions' do
      it 'render track tag' do
        options = { captions: { ja: { :'Japanese' => 'http://example.com/captions.vtt' } } }
        expect(helper.render_video_for_vjs(options)).to have_tag 'video.video-js.vjs-default-skin' do
          with_tag 'track', count: 1, with: { kind: 'captions', src: 'http://example.com/captions.vtt', srclang: 'ja', label: 'Japanese' }
        end
      end
    end

    context 'when there are block' do
      it 'customize nojs message' do
        expect(helper.render_video_for_vjs { 'foo' }).to have_tag 'video.video-js.vjs-default-skin' do
          with_tag 'p', count: 1, text: 'foo'
        end
      end
    end
  end

end
