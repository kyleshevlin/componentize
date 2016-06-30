# Componentize

Rails generator for inline and block level "components". Generates a view file, SCSS partial, and adds the right `@import` to the `base.scss` file.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'componentize'
```

And then execute:

```
$ bundle
```

Or install it yourself as:

```
$ gem install componentize
```

## Usage

```
rails generate component <NAME> [options]
```

## Options

| Option | Type | Description | Default Value |
|---|---|---|---|
| --format | String | File extension format. Can be `erb`, `slim`, or `haml` | `erb` |
| --block | Boolean | Whether component is inline or block level | `false` |

## Full Example

```
rails generate component my-block-component --format slim --block
```

## Including Components in Views

Inline component:

```erb
<%= render 'my_component', foo: 'bar' %>
```

Block component:

```erb
<%= render layout: 'my_section', locals: { foo: 'bar' } do %>
  <%# Content goes here and is rendered in the block's yield %>
<% end %>
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/kyleshevlin/componentize.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

