use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :bangtan, BangtanWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :bangtan, Bangtan.Repo,
  username: "postgres",
  password: "postgres",
  database: "bangtan_test",
  hostname: System.get_env("POSTGRES_HOST", "localhost"),
  virtual_host: "/",
  port: String.to_integer(System.get_env("POSTGRES_PORT", "5432")),
  pool: Ecto.Adapters.SQL.Sandbox,
  adapter: Ecto.Adapters.Postgres,
