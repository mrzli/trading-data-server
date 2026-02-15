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
│       ├── symbols.rb
│       ├── info.rb
│       └── data.rb
├── app.rb
├── config.ru
├── Gemfile
└── README.md
```

- `app.rb`: canonical app entrypoint (bundler + Zeitwerk loader + exposes `Application`)
- `config.ru`: Rack server entrypoint (mounts `Application` at `/api`)
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
# Start the development server (automatically kills any existing process on the port)
./bin/dev

# Stop the server
./bin/kill
```

Server runs on http://localhost:4567

## API Routes

All routes are prefixed with `/api`.

### Example Routes

```bash
# Hello message
curl http://localhost:4567/api/example/hello

# Display environment variable
curl http://localhost:4567/api/example/env
```

### Symbols

```bash
# List all exchanges
curl http://localhost:4567/api/symbols/exchanges
```

### Info

```bash
# Get dividends for a symbol
curl http://localhost:4567/api/info/dividends/us/aapl

# Get splits for a symbol
curl http://localhost:4567/api/info/splits/us/aapl
```

### Market Data

```bash
# Get end-of-day data (CSV)
curl http://localhost:4567/api/data/day/us/aapl

# Get intraday data for date range (JSON with CSV values)
curl "http://localhost:4567/api/data/intra/us/aapl?from=2020-01&to=2020-02"
```
