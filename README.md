# trading-data-server

Minimal Sinatra app with a scalable project layout.

## Project layout

```text
.
├── app/
│   ├── application.rb
│   ├── config.rb
│   └── routes/
│       ├── example.rb
│       └── exchanges.rb
├── app.rb
├── config.ru
├── Gemfile
└── README.md
```

- `app.rb`: canonical app entrypoint (bundler + Zeitwerk loader + exposes `Application`)
- `config.ru`: Rack server entrypoint (`run Application`)
- `app/application.rb`: main Sinatra application class (`Application`)
- `app/config.rb`: environment configuration module (`Config`)
- `app/routes/*`: route modules (`Routes` namespace)
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
