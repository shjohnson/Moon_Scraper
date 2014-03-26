require 'spec_helper'
require './lib/moon'


describe Moon do

	describe "#get_input_year" do
		it "it asks the user to input a year" do
      subject.should_receive(:gets).and_return('1900')
      subject.get_input_year
		end

    describe "when the input year is valid" do
      it "it will call first_full_moon_date" do
        input_year = '1901'
        subject.stub(:gets).and_return(input_year)
        subject.should_receive(:vaild_year?).with(input_year).and_return(true)
        subject.get_input_year
      end
    end

	end

  describe "#vaild_year?" do
    it "returns true is the year is between 1 and 2100" do
      expect(subject.vaild_year?("1900")).to be true
    end

    it "returns false is the year is not between 1 and 2100" do
      expect(subject.vaild_year?("2200")).to be false
    end
  end

end