require './lib/station'

describe Station do
  subject(:station) {Station.new('test1', 1)}
  describe ' #correct?' do
    it 'station' do
        expect(subject.station).to eq 'test1'
    end

    it 'zone' do
        expect(subject.zone).to eq 1
    end
  end
end