# trading-data-server

Minimal Sinatra app with a scalable project layout.

## Project layout

```text
.
├── app/
│   ├── app.rb
│   ├── config/
│   │   └── environment.rb
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
- `app/config/environment.rb`: app environment configuration (autoloaded by Zeitwerk)
- `app/routes/*`: modular route registration
- `app.rb`: canonical app entrypoint (loads boot and exposes `App`)
- `config.ru`: Rack server entrypoint (`run App`)

## Setup

```bash
mise install
bundle install
cp .env.example .env
```

## Environment variables

- `EODHD_ROOT`: Base URL for the EODHD API.
- Default: `https://eodhd.com/api` (used when unset).

## Run

```bash
./bin/dev
```

Open http://localhost:4567
