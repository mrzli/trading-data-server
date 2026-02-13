# trading-data-server

Minimal Sinatra app with a scalable project layout.

## Project layout

```text
.
├── app/
│   ├── app.rb
│   └── routes/
│       └── root_routes.rb
├── config/
│   └── boot.rb
├── app.rb
├── config.ru
├── Gemfile
└── README.md
```

- `config/boot.rb`: central boot file (bundler + Zeitwerk loader)
- `app/app.rb`: main Sinatra application class
- `app/routes/*`: modular route registration
- `app.rb`: canonical app entrypoint (loads boot and exposes `App`)
- `config.ru`: Rack server entrypoint (`run App`)

## Setup

```bash
mise install
bundle install
```

## Run

```bash
./bin/dev
```

Open http://localhost:4567
