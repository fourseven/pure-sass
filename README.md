# Pure::Sass

pure-sass is a port of (Yahoo!'s Pure CSS)[http://purecss.io/] framework to SASS.

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
@include 'pure/all'
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
