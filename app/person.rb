# frozen_string_literal: true

class Person
  attr_reader :first_name, :last_name, :birthdate, :city

  def initialize(first_name, birthdate, city, last_name = nil)
    @first_name = first_name
    @last_name = last_name
    @birthdate = birthdate.strftime('%-m/%-d/%Y')
    @city = city
  end

  def to_s
    [first_name, city, birthdate].join(', ')
  end
end
