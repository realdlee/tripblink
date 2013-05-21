require 'spec_helper'

describe Country do
  context "validations" do
    it { should respond_to :name}
    it { should respond_to :image}
    it { should respond_to :region}

    it { should belong_to :region }
    it { should validate_presence_of :name }
    it { should validate_presence_of :image }
  end

  context "new" do

  end

end