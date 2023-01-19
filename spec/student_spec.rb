require 'spec_helper'

describe Student do

  before :each do
    @student = Student.new "Title", "Author"
  end

    describe '#new' do
      it "returns a new student object" do
        @student.should be_an_instance_of Student
      end
    end
  end

