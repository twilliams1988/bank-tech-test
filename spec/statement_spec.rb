require_relative '../statement'

describe Statement do



  describe '#update_statement' do

    it { is_expected.to respond_to(:update_statement).with(3).arguments }

    it 'adds the transaction to the statement array' do
      subject.update_statement(10,0,10)
      puts subject.transactions.inspect
      expect(subject.transactions.count).to eq(2)
    end
  end

  describe '#transaction_date' do
    it 'returns the current date in ddmmyy format' do
      expect(subject.transaction_date).to eq("19/09/16")
      # match(/^\d{1,2}\/\d{1,2}\/\d{4}$/)
    end
  end
end
