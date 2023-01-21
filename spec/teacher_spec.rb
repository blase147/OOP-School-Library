require 'spec_helper'

describe Teacher do
  before :each do
    @teacher = Teacher.new 'Specialization', 58, 'Name'
  end

  describe '#new' do
    it 'returns a new teacher object' do
      @teacher.should be_an_instance_of Teacher
    end
  end

  describe '#age' do
    it 'returns the correct age of the student' do
      @teacher.age.should == 58
    end
  end

  describe '#name' do
    it 'returns the correct name' do
      @teacher.name.should == 'Name'
    end
  end

  describe '#parent_permission' do
    it 'returns the correct parent_permission' do
      @teacher.parent_permission.should == true
    end
  end

  describe '#Specialization' do
    it 'returns the correct specialization' do
      @teacher.specialization.should == 'Specialization'
    end
  end

  describe '#Can use services ?' do
    it 'Confirmes if teacher can use services' do
      @teacher.can_use_services.should == true
    end
  end
end
