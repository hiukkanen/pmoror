require 'spec_helper'

describe Task do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :status => 1
    }
  end

  it "should create a new instance given valid attributes" do
    Task.create!(@valid_attributes)
  end
end
