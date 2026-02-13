# trading-data-server

Minimal Sinatra app with a scalable project layout.

## Project layout

```text
.
├── app/
│   ├── application.rb
│   └── routes/
│       └── root_routes.rb
├── config/
│   └── boot.rb
├── app.rb
├── config.ru
├── Gemfile
└── README.md
```

- `config/boot.rb`: central boot file (bundler + app loading)
- `app/application.rb`: main Sinatra application class
- `app/routes/*`: modular route registration
- `app.rb`: compatibility entrypoint

## Setup

```bash
mise install
bundle install
```

## Run

```bash
bundle exec rackup -s puma -p 4567
```

Open http://localhost:4567
