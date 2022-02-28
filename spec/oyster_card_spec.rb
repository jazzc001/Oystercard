require 'oyster_card'
describe OysterCard do
  let double(:station) {"Southwark"}
  it 'checks default balance is 0' do
    expect(subject.balance).to eq 0
  end

  it 'check top up method works correctly' do
    expect(subject.top_up(10)).to eq 10
  end

  it 'makes sure the balance does not exceed £90' do
    expect{subject.top_up(91)}.to raise_error
  end

  #private method tested through touch out
  # it 'ensures correct balance after deducting money' do
  #   subject.top_up(50)
  #   expect(subject.deduct(40)).to eq 10
  # end

  it 'tests touch in functionality is correct' do
    subject.top_up(20)
    subject.touch_in
    expect(subject.in_journey?).to eq true
  end

  it 'tests touch out functionality is correct' do
    subject.top_up(20)
    subject.touch_in
    subject.touch_out
    expect(subject.in_journey?).to eq false
  end

  it 'tests error is card has less than minimum fare' do
    expect{subject.touch_in}.to raise_error
  end

  it 'tests touch out deducts minimum fare' do
    subject.top_up(50)
    subject.touch_in
    expect {subject.touch_out}.to change{ subject.balance}.by(-subject.MINIMUM_FARE)
  end

  it 'saves the entry station on touch in' do
    subject.top_up(10)
    subject.touch_in
    expect(subject.entry_station(station)).to eq "Southwark"
  end
end