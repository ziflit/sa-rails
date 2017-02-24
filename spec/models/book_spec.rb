require 'rails_helper'

describe Book do
  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:author) }
  it { is_expected.to validate_presence_of(:genre) }
  it { is_expected.to validate_presence_of(:year) }
  it { is_expected.to validate_presence_of(:image) }
  it { is_expected.to validate_presence_of(:publisher) }

  describe '#create' do
    context 'with non nil fields' do
      subject :book do
        create(:book)
      end
      it { is_expected.to be_valid }
    end
  end
end
