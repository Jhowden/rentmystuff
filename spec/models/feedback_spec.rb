require 'spec_helper'

describe Feedback do
  it 'validates presence of thumbs up' do
    Feedback.new.should_not be_valid
  end

  it 'validates presence of comment' do
    Feedback.new(:thumbs_up => false).should_not be_valid
  end

end
