require 'spec_helper'

describe Teacher do

  before :each do
    @teacher = Teacher.new "Specialization", "Age", "Name"
  end

    describe '#new' do
      it "returns a new teacher object" do
        @teacher.should be_an_instance_of Teacher
      end
    end
  end

