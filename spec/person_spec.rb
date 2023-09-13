require 'rspec'
require_relative '../person'
require_relative '../book'
require_relative '../rental'

describe 'testing person' do
  context 'When testing the Person class' do
    it 'should create a person properly' do
      person = Person.new(15, 54, 'NAME')
      expect(person.class).to eq Person
    end
    it "should return the person's name" do
      person = Person.new(15, 54, 'NAME')
      expect(person.correct_name).to eq 'NAME'
    end
    it 'should return if the person can use services or not = ' do
      person = Person.new(15, 54, 'NAME')
      expect(person.can_use_services?).to eq true
    end
  end
end
