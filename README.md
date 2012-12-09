# Guard::I18nJs

[i18n-js](https://github.com/fnando/i18n-js) is a small library 
to provide the I18n translations on the Javascript. guard-i18n-js 
runs the i18n-js exporter to generate the new translations js 
when needed.

- Compatible with i18n-js 3.0.0.rc*
- Tested on Ruby 1.8.7, 1.9.2 & 1.9.3

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'guard-i18n-js'
```

And then execute:

```bash
$ bundle
```

Or install it yourself as:

```bash
$ gem install guard-i18n-js
```

Add guard definitions to your Guardfile by running:

```bash
$ guard init i18n-js
```

## Usage

Please read the {Guard usage docs}[https://github.com/guard/guard#readme]

### Standard Ruby on Rails project

```ruby
guard 'i18n-js' do
  watch(%r{config/locales/.+\.yml})
end
```

## Development

* Source hosted at [GitHub](https://github.com/sishen/guard-i18n-js)
* Report issues/Questions/Feature requests on [GitHub Issues](https://github.com/sishen/guard-i18n-js/issues)

## Authors

[Dingding Ye](https://github.com/sishen) ([@yedingding](https://twitter.com/yedingding))
