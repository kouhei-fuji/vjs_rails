# VjsRails

[![Build Status](https://travis-ci.org/kouhei-fuji/vjs_rails.svg?branch=master)](https://travis-ci.org/kouhei-fuji/vjs_rails) [![Coverage Status](https://img.shields.io/coveralls/kouhei-fuji/vjs_rails.svg)](https://coveralls.io/r/kouhei-fuji/vjs_rails) [![Gem Version](https://badge.fury.io/rb/vjs_rails.svg)](http://badge.fury.io/rb/vjs_rails)

VjsRails is for using Video.js in Rails applications.

Video.js:

- version 4.9.1
- http://www.videojs.com/

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'vjs_rails'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install vjs_rails

## Usage

### Add to use VjsRails asset files

In your `application.js`:

```coffeescript
# required
//= require vjs

# if you use turbolinks
//= require jquery
//= require turbolinks
//= require vjs.turbolinks

# if you want to use local flash.swf
//= require vjs.flash

# if you want to use a Japanese version
# see more: https://github.com/kouhei-fuji/vjs_rails/tree/master/vendor/assets/langs
//= require vjs.ja
```
In your `application.css`:

```css
/*
 *= require vjs
 *
 * If you want to customize it, see: http://designer.videojs.com/
 * you can copy and add your customized css instead of `vjs`
 *
 *= require my_custom_css
 */
```

### Use VjsRails Helper

In your `xxx.html.haml`:

```haml
-# sources required
= render_video_for_vjs sources: { :'video/mp4' => 'http://example.com/path/to/video.mp4', :'video/webm' => 'http://example.com/path/to/video.webm' }

-# id, class, width and height
= render_video_for_vjs id: 'my_id', :class => 'my_class', width: '640px', height: '264px'

-# captions
= render_video_for_vjs captions: { ja: { :'日本語' => 'http://example.com/path/to/ja_caption.vtt' }, en: { :'English' => 'http://example.com/path/to/en_caption.vtt' } }

-# other options
-# see more: https://github.com/videojs/video.js/blob/stable/docs/guides/options.md
= render_video_for_vjs poster: 'http://example.com/path/to/poster.png', autoplay: true

-# customize no js comment
= render_video_for_vjs sources: { :'video/mp4' => 'http://example.com/path/to/video.mp4' } do
  Customize Message when js is not woking
```

If you don't use haml, please replace it.

## Example

VjsRails provides an example rails application in spec/dummy directory.

https://github.com/kouhei-fuji/vjs_rails/tree/master/spec/dummy

```
$ git clone git@github.com:kouhei-fuji/vjs_rails.git
$ cd vjs_rails/spec/dummy
$ bundle install
$ bin/rails s
$ open http://localhost:3000
```

## Contributing

1. Fork it ( https://github.com/kouhei-fuji/vjs_rails/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## License

VjsRails under the [MIT License](https://github.com/kouhei-fuji/vjs_rails/blob/master/MIT-LICENSE).
