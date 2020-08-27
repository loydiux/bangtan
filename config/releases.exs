import Config

config :bangtan, BangtanWeb.Endpoint,
  server: true,
  url: [host: System.get_env("APP_NAME") <> ".gigalixirapp.com", port: 443],
  # url: [host: "localhost", port: 4000],
  pool_size: 2,
  timeout: 120_000,
  queue_target: 5000,
  queue_interval: 100_000
