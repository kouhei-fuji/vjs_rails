# VjsRails

[![Build Status](https://travis-ci.org/kouhei-fuji/vjs_rails.svg?branch=master)](https://travis-ci.org/kouhei-fuji/vjs_rails) [![Coverage Status](https://img.shields.io/coveralls/kouhei-fuji/vjs_rails.svg)](https://coveralls.io/r/kouhei-fuji/vjs_rails) [![Gem Version](https://badge.fury.io/rb/vjs_rails.svg)](http://badge.fury.io/rb/vjs_rails)

VjsRails is for using Video.js in Rails applications. It works in [Turbolinks](https://github.com/rails/turbolinks).

Video.js:

- Version 4.9.1
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
# see more: vendor/assets/langs/
//= require vjs.ja
```
In your `application.css`:

```css
*= require vjs
```

If you want to customize css:

```
$ bin/rails g vjs_rails:assets --help
Usage:
  rails generate vjs_rails:assets [FILE_NAME] [options]

Options:
  -l, [--less], [--no-less]  # Create LESS file instead of CSS

Runtime options:
  -f, [--force]                    # Overwrite files that already exist
  -p, [--pretend], [--no-pretend]  # Run but do not make any changes
  -q, [--quiet], [--no-quiet]      # Suppress status output
  -s, [--skip], [--no-skip]        # Skip files that already exist

Description:
    Creates the Video.js CSS file to your application.

Example:
    rails g vjs_rails:assets [FILE_NAME]

    This will create:
        DEFAULT:   app/assets/stylesheets/vjs.css.erb
        FILE_NAME: app/assets/stylesheets/FILE_NAME.css.erb

$ bin/rails g vjs_rails:assets
      create  app/assets/stylesheets/vjs.css.erb
```

Or: You can create customized css in [VIDEO.JS PLAYER DESIGNER](http://designer.videojs.com/).


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

VjsRails provides an example rails application in [spec/dummy directory](https://github.com/kouhei-fuji/vjs_rails/tree/master/spec/dummy).

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

VjsRails is under the [MIT License](https://github.com/kouhei-fuji/vjs_rails/blob/master/MIT-LICENSE).
