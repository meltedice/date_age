# -*- coding: utf-8 -*-

require "spec_helper"

describe DateAge do
  describe "age_at" do
    it "should be 0 years old" do
      birthday = Date.parse("2010/01/01")
      today    = Date.parse("2010/01/01")
      birthday.age_at(today).should == 0

      birthday = Date.parse("2010/01/01")
      today    = Date.parse("2010/12/31")
      birthday.age_at(today).should == 0
    end

    it "should be 1 year old" do
      birthday = Date.parse("2010/01/01")
      today    = Date.parse("2011/01/01")
      birthday.age_at(today).should == 1

      birthday = Date.parse("2010/01/01")
      today    = Date.parse("2011/05/05")
      birthday.age_at(today).should == 1

      birthday = Date.parse("2010/01/01")
      today    = Date.parse("2011/12/31")
      birthday.age_at(today).should == 1
    end
  end
end
