module Types
  module Anime
    AGE_RATINGS = %w[none g pg pg_13 r r_plus rx]

    AGE_RATING = Types::Strict::String
      .constructor(&:to_s)
      .enum(*AGE_RATINGS)
  end
end
