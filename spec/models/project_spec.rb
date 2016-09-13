require 'spec_helper'

describe Project do
  it 'should create a new instance given valid attributes' do
    Factory.create :project
  end
end
