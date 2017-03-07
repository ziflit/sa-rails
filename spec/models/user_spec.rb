require 'rails_helper'

describe User do
  # validate_uniqueness_of doesn't fully populate the object so we need this to
  # make sure that non-null fields are present
  subject { User.new(verification_code: AuthenticableEntity.verification_code) }

  it { is_expected.to validate_presence_of(:password) }
  it { is_expected.to validate_length_of(:password).is_at_least(8) }
  it { is_expected.to validate_length_of(:password).is_at_most(128) }
  it { is_expected.to validate_confirmation_of(:password) }
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_uniqueness_of(:email).case_insensitive }

  describe '#create' do
    context 'with non nil fields' do
      subject :user do
        create(:user)
      end
      it { is_expected.to be_valid }
    end
  end
end
