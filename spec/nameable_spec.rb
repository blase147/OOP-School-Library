require 'spec_helper'

describe Nameable do

  before :each do
    @nameable = Nameable.new 
  end

    describe '#new' do
      it "returns a new name object" do
        @nameable.should be_an_instance_of Nameable
      end
    end
  end

