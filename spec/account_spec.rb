require_relative '../account'

describe Account do

describe '#balance' do
  it 'returns a default starting balance of £0' do
    expect(subject.balance).to eq(0)
  end
end

describe '#credit' do
  it 'increases balance by amount of the deposit' do
    expect{subject.credit(10)}.to change{subject.balance}.from(0).to(10)
  end
end

describe '#debit' do
  it 'decrease balance by amount of the withdrawl' do
    subject.credit(10)
    expect{subject.debit(10)}.to change{subject.balance}.from(10).to(0)
  end

  it 'debit can cause account balance to be negative' do
    expect{subject.debit(10)}.to change{subject.balance}.from(0).to(-10)
  end
end

end
