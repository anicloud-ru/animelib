module Types
  module Anime
    AGE_RATINGS = %w[none g pg pg_13 r r_plus rx]
    KINDS = %w[tv movie ona ova spec music]
    STATUSES = %w[announced ongoing released dropped]

    AGE_RATING = Types::Strict::String
      .constructor(&:to_s)
      .enum(*AGE_RATINGS)
    KIND = Types::Strict::String
      .constructor(&:to_s)
      .enum(*KIND)
    STATUS = Types::Strict::String
      .constructor(&:to_s)
      .enum(*STATUSES)
  end
end
