require './lib/candidate'

RSpec.describe Candidate do
    before(:each) do
      @diana = Candidate.new({name: "Diana D", party: :democrat})
  
    end
    describe 'candidate' do
      it 'is a candidate' do
        expect(@diana).to be_an_instance_of (Candidate)
      end
  
      it 'has a name' do
        expect(@diana.name).to eq ("Diana D")
      end

      it 'has a party' do
        expect(@diana.party).to eq (:democrat)
      end

      it 'begins with zero votes' do
        expect(@diana.votes).to eq (0)
      end
    end

    describe 'vote for' do
        it 'can be voted for' do
            @diana.vote_for!
            @diana.vote_for!
            @diana.vote_for!
            
            expect(@diana.votes).to eq (3)

            @diana.vote_for!

            expect(@diana.votes).to eq (4)
        end
    end
end