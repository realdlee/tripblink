require 'spec_helper'

describe Region do
  context "validations" do
    it { should respond_to :name}

    it { should validate_presence_of :name }
  end

end
