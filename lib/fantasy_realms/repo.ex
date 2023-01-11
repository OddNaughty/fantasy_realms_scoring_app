defmodule FantasyRealms.Repo do
  use Ecto.Repo,
    otp_app: :fantasy_realms,
    adapter: Ecto.Adapters.Postgres
end
