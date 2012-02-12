# -*- coding: utf-8 -*-

require "spec_helper"

describe DateAge do
  def birthday(str) Date.parse(str) end
  def today(str)    Date.parse(str) end

  describe "age_at" do
    describe "between different years" do
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

    describe "between the same years" do
      it "should be 0 years old" do
        birthday("2010/01/01").age_at(today("2010/01/01")).should == 0
        birthday("2010/01/01").age_at(today("2010/12/31")).should == 0
      end
    end

    describe "0 years old between different years" do
      it "should be 0 years old" do
        birthday("2010/02/01").age_at(today("2011/01/31")).should == 0
        birthday("2010/02/02").age_at(today("2011/02/01")).should == 0
      end
    end

    describe "-1 year old" do
      it "should be -1 years old" do
        birthday("2011/01/31").age_at(today("2010/02/01")).should == -1
        birthday("2011/02/01").age_at(today("2010/02/02")).should == -1
      end
    end

    # http://en.wikipedia.org/wiki/Leap_year
    describe "in leap year" do
      it "should treat birthday Feb. 29th as Mar. 1st in non leap year" do
        birthday("1996/02/29").age_at(today("2011/02/28")).should == 14
        birthday("1996/02/29").age_at(today("2011/03/01")).should == 15
        birthday("1996/02/29").age_at(today("2012/02/28")).should == 15
        birthday("1996/02/29").age_at(today("2012/02/29")).should == 16
        birthday("1996/02/29").age_at(today("2012/03/01")).should == 16
      end
    end
  end
end
