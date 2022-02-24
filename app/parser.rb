# frozen_string_literal: true

class Parser
  CITY_ABBR = {
    'LA' => 'Los Angeles',
    'NYC' => 'New York City'
  }.freeze
  FORMAT = {
    percent: {
      separator: ' % ',
      date: '%Y-%m-%d'
    }.freeze,
    dollar: {
      separator: ' $ ',
      date: '%d-%m-%Y'
    }.freeze
  }.freeze

  def initialize(data:, format:)
    @data = data.split("\n")
    @format = format
    @separator = FORMAT.dig(format, :separator)
    @headers = @data.first.split(@separator)
  end

  def parse
    data.drop(1).map do |row|
      obj = {}
      row.split(separator).each_with_index do |column, idx|
        formatter(obj, column, idx)
      end

      Person.new(
        obj[:first_name], obj[:birthdate], obj[:city], obj[:last_name]
      )
    end
  end

  private

  attr_reader :data, :format, :separator, :headers

  def formatter(obj, column, index)
    obj[headers[index].to_sym] = if headers[index] == 'birthdate'
                                   Date.strptime(
                                     column,
                                     FORMAT.dig(format, :date)
                                   )
                                 elsif headers[index] == 'city'
                                   CITY_ABBR[column] || column
                                 else
                                   column
                                 end
  end
end
