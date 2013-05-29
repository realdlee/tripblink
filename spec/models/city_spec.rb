require 'spec_helper'

describe City do
  context "validations" do
    it { should respond_to :name}
    it { should respond_to :image}
    it { should respond_to :country}
    it { should respond_to :backpacker_index}

    it { should belong_to :country }
    it { should validate_presence_of :name }
    it { should validate_uniqueness_of :name }
    it { should validate_presence_of :country_id }
    it { should_not validate_presence_of :backpacker_index }
    it { should validate_numericality_of :backpacker_index }

  end

end