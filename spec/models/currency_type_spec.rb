require 'spec_helper'

describe CurrencyType, type: :model do
  it { is_expected.to belong_to :country }
end
