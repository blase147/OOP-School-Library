require 'spec_helper'

describe Person do

  before :each do
    @person = Person.new "Title", "Author"
  end

    describe '#new' do
      it "returns a new person object" do
        @person.should be_an_instance_of Person
      end
    end
  end

