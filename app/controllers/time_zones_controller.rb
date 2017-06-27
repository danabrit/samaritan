class TimeZonesController < ApplicationController
  def states_for_country
    country = ISO3166::Country.new(params[:country_code])
    states = country.states.map do |state|
      # The countries gem only returns valid state codes for some countries
      country.alpha2 == "US" ? symbol_same(state) : symbol_different(state)
    end

    render json: states
  end

  private

  def symbol_same(state)
    # You have to escape single quotes or it breaks the interpolation for
    # option tags in the Coffeescript.
    { "symbol": state[0].tr("'", "`"), "name": state[1]["name"] }
  end

  def symbol_different(state)
    # You have to escape single quotes or it breaks the interpolation for
    # option tags in the Coffeescript.
    { "symbol": state[1]["name"].tr("'", "`"), "name": state[1]["name"] }
  end
end
