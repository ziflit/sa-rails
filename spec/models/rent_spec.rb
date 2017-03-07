require 'rails_helper'

describe Rent do
  it { should belong_to(:user) }
  it { should belong_to(:book) }
end
