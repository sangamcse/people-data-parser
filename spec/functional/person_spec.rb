# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Person do
  let(:person) do
    Person.new('Mckayla', Date.strptime('1986-05-29', '%Y-%m-%d'), 'Atlanta')
  end

  context '#to_s' do
    it 'returns string in first_name, city and birthdate format' do
      expect(person.to_s).to eq('Mckayla, Atlanta, 5/29/1986')
    end
  end
end
