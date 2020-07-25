# frozen_string_literal: true

require "covid/version"
require "json"
require "csv"
require "net/http"

module Covid
  class Error < StandardError; end
  class Result < Array
    def country(name)
      filter("Country/Region", name)
    end

    def state(name)
      filter("Province/State", name)
    end

    alias_method :region, :country
    alias_method :province, :state

    private

    def filter(key, name)
      self.class.new(select { |result| result[key] == name })
    end
  end

  class Nineteen
    BASE_URI = "https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/"
    CONFIRMED = "time_series_covid19_confirmed_global.csv"
    DEATHS = "time_series_covid19_deaths_global.csv"
    RECOVERED = "time_series_covid19_recovered_global.csv"

    def initialize(path)
      @path = path
    end

    def run
      Result.new(parsed_json)
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

    def raw
      csv.map(&:to_h).to_json
    end

    def response
      Net::HTTP.get(uri)
    end

    def parsed_json
      JSON.parse(raw)
    end

    def uri
      URI(BASE_URI + @path)
    end
  end
end
