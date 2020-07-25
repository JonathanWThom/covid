RSpec.describe Covid do
  it "has a version number" do
    expect(Covid::VERSION).not_to be nil
  end

  shared_examples "result type" do |result|
    it "is not empty" do
      expect(result).to_not be_empty
    end

    it "can filter by country" do
      expect(result.country("China")).to_not be_empty
    end

    it "can filter by region" do
      expect(result.region("China")).to_not be_empty
    end

    it "can filter by state" do
      expect(result.state("Victoria")).to_not be_empty
    end
    
    it "can filter by province" do
      expect(result.province("Victoria")).to_not be_empty
    end

    it "can filter by country and state" do
      expect(result.country("Australia").state("Tasmania")).to_not be_empty
    end
  end

  describe Covid::Nineteen do
    describe ".confirmed" do
      it_behaves_like "result type", Covid::Nineteen.confirmed
    end

    describe ".deaths" do
      it_behaves_like "result type", Covid::Nineteen.deaths
    end

    describe ".recovered" do
      it_behaves_like "result type", Covid::Nineteen.recovered 
    end
  end
end
