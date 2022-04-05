# pass-confuse

`pass-confuse` is a tool to protect your configuration files like your passwords using [pass](https://www.passwordstore.org/).

_Confusing_ a file in our context means:
 * Encrypt the file in `pass`
 * Remove the clear-text file
 * Symlink the encrypted entry from `pass` to original path

## Usage

To _confuse_ a file:

```
pass-confuse ~/.my-config-with-secrets.conf
```

Now, any accesses to `~/.my-config-with-secrets.conf` will trigger a `pass` call.

## Installation

```shell-session
$ gem install pass-confuse
```

`pass-confuse` relies on `pass-confused` to be started to work.

`pass-confused` is a background process to mount the virtual filesystem to put configuration files in.

To run `pass-confused`, you can run it manually or use `systemd --user` to handle the service in userland.

In `~/.config/systemd/user/pass-confused.service`:

```
[Unit]
Description=Pass Confused service

[Service]
ExecStart=/usr/bin/pass-confused

[Install]
WantedBy=default.target
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/opus-codium/pass-confuse.

