# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Parser do
  let(:data) { File.read('spec/fixtures/people_by_dollar.txt') }
  let(:format) { :dollar }

  context '#parse' do
    it 'returns list of Person instances' do
      parsed_data = Parser.new(data: data, format: :dollar).parse

      expect(parsed_data.count).to eq(2)
      expect(parsed_data.first).to be_an_instance_of(Person)
      expect(parsed_data.first.to_s).to eq('Rhiannon, Los Angeles, 4/30/1974')
    end
  end
end
