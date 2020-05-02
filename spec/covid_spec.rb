RSpec.describe Covid do
  it "has a version number" do
    expect(Covid::VERSION).not_to be nil
  end

  describe Covid::Nineteen do
    describe ".confirmed" do
      subject { Covid::Nineteen.confirmed }
      it { is_expected.to_not be_empty }
    end

    describe ".deaths" do
      subject { Covid::Nineteen.deaths }
      it { is_expected.to_not be_empty }
    end

    describe ".recovered" do
      subject { Covid::Nineteen.recovered }
      it { is_expected.to_not be_empty }
    end
  end
end
