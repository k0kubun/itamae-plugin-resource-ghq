# Itamae::Plugin::Resource::Ghq

[Itamae](https://github.com/ryotarai/itamae) resource plugin to manage repositories with [ghq](https://github.com/ryotarai/itamae).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'itamae-plugin-resource-ghq'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install itamae-plugin-resource-ghq

## Usage

```ruby
require "itamae/plugin/resource/ghq"

# ghq get ryotarai/itamae
ghq "ryotarai/itamae"

# ghq get -u serverspec/specinfra
ghq "serverspec/specinfra" do
  options "-u"
end
```

## Contributing

1. Fork it ( https://github.com/k0kubun/itamae-plugin-resource-ghq/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
