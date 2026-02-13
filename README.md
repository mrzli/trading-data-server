# trading-data-server

Minimal Sinatra app with a scalable project layout.

## Project layout

```text
.
├── app/
│   ├── app.rb
│   ├── config/
│   │   └── config.rb
│   └── routes/
│       └── root.rb
├── config/
│   └── boot.rb
├── app.rb
├── config.ru
├── Gemfile
└── README.md
```

- `config/boot.rb`: central boot file (bundler + Zeitwerk loader)
- `app/app.rb`: main Sinatra application class
- `app/config/config.rb`: environment configuration module (collapsed namespace)
- `app/routes/*`: modular route registration (collapsed namespace)
- `app.rb`: canonical app entrypoint (loads boot and exposes `App`)
- `config.ru`: Rack server entrypoint (`run App`)

## Setup

```bash
mise install
bundle install
cp .env.example .env
```

## Environment variables

- `EODHD_DIR`: Directory path for EODHD data (required).

## Run

```bash
./bin/dev
```

Open http://localhost:4567
