require 'spec_helper'

describe Comment do
  it { should belong_to :commentable}
  it { should validate_presence_of :content }
  it { should validate_presence_of :commentable_type }
  it { should validate_presence_of :commentable_id }
  it { should ensure_length_of(:content).is_at_most(100) }
end
