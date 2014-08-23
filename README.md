# Pure::Sass

pure-sass is a port of [Yahoo!'s Pure CSS](http://purecss.io/) framework to SASS.

[![Build Status](https://travis-ci.org/fourseven/pure-sass.svg?branch=master)](https://travis-ci.org/fourseven/pure-sass)

## Plea

To be honest, I don't really know that much about CSS, I just wanted this Gem to exist so that I
could use it on a project.  I will gladly accept almost any contribution to help with maintaining
this Gem and will give commit rights to anyone who asks for it.

In the long run, I expect that maintainership will be handed to someone else, but I'm happy to
incubate it here for now.

## Usage

Add pure-sass to your applications `Gemfile`

```ruby
gem 'pure-sass'
```

Then in your `app/assets/stylesheets/application.css` you can use

```
 *= require pure/all
```

or in your SASS or SCSS files you can use

```sass
@import 'pure/all'
```

If you don't want all of Pure then you can manually include

  * `pure/defaults` - default theme
  * `pure/base` - base styles based on [normalize.css](http://necolas.github.io/normalize.css/)
  * `pure/buttons` - Pure's button module
  * `pure/forms` - Pure's form module
  * `pure/grids` - Pure's grid layout
  * `pure/menus` - PUre's menu module
  * `pure/tables` - Pure's table module

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
