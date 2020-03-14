# frozen_string_literal: true

require "covid/version"
require "json"
require "csv"
require "net/http"

module Covid
  class Error < StandardError; end
  class Nineteen
    BASE_URI = "https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/"
    CONFIRMED = "time_series_19-covid-Confirmed.csv"
    DEATHS = "time_series_19-covid-Deaths.csv"
    RECOVERED = "time_series_19-covid-Recovered.csv"

    def initialize(path)
      @path = path
    end

    def run
      csv.map(&:to_h).to_json
    end

    def self.confirmed
      new(CONFIRMED).run
    end

    def self.deaths
      new(DEATHS).run
    end

    def self.recovered
      new(RECOVERED).run
    end

    private

    def csv
      CSV.parse(response, headers: true)
    end

    def response
      Net::HTTP.get(uri)
    end

    def uri
      URI(BASE_URI + @path)
    end
  end
end
