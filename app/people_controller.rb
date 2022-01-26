# frozen_string_literal: true

class PeopleController
  def initialize(params)
    @params = params
  end

  def normalize
    formatted_data = Parser.new(
      data: @params[:percent_format],
      format: :percent
    ).parse
    formatted_data += Parser.new(
      data: @params[:dollar_format],
      format: :dollar
    ).parse

    sorted_data = sort_by(data: formatted_data, order: params[:order])
    sorted_data.map(&:to_s)
  end

  private

  attr_reader :params

  def sort_by(data:, order:)
    data.sort_by(&order)
  end
end
