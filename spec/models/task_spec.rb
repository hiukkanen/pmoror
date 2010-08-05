require 'spec_helper'

describe Task do

  it "should create a new instance given valid attributes" do
    Factory.create :task
  end
end
