# SoulCatcher

Soul Catcher enables us to list MAC addresses connected client to nearby wifi access points.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'soul_catcher'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install soul_catcher

## Usage

```sh
Usage: soul_catcher [-sliv]

Specific options:
    -s, --ssid *SSID                 Set one of severals SSID of the targeted access point
    -l, --length=[length]            Set the duration of the scan (default: normal)
    -i, --interface=[interface]      Set the interface of the targeted access point which will be used (default: wlan0)

Common options: 
        --help                       Show this message
    -v, --version                    Show version
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/soul_catcher/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
