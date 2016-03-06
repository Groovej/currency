require 'spec_helper'

describe Country, type: :model do
  it { is_expected.to have_many :currency_types }
end
