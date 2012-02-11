# -*- coding: utf-8 -*-

require "spec_helper"

describe DateAge do
  def birthday(str) Date.parse(str) end
  def today(str)    Date.parse(str) end

  describe "age_at between different years" do
    it "should be 1 year old" do
      birthday("2010/01/01").age_at(today("2011/01/01")).should == 1
      birthday("2010/01/01").age_at(today("2011/05/05")).should == 1
      birthday("2010/01/01").age_at(today("2011/12/31")).should == 1
    end

    it "should be greater than 1 year old" do
      birthday("1980/01/01").age_at(today("2011/01/01")).should == 31
      birthday("1980/01/01").age_at(today("2011/05/05")).should == 31
      birthday("1980/01/01").age_at(today("2011/12/31")).should == 31
    end
  end

  describe "age_at between the same years" do
    it "should be 0 years old" do
      birthday("2010/01/01").age_at(today("2010/01/01")).should == 0
      birthday("2010/01/01").age_at(today("2010/12/31")).should == 0
    end
  end
end
