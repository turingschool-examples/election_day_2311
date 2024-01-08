require './lib/candidate'
require './lib/race'

RSpec.describe Race do
    before(:each) do
        @race = Race.new("Texas Governor")
    end
    describe 'race' do
      it 'is a race' do
        expect(@race).to be_an_instance_of (Race)
      end
  
      it 'has an office' do
        expect(@race.office).to eq ("Texas Governor")
      end

      it 'has candidates' do
        expect(@race.candidates).to eq ([])
      end
    end

    describe '#register_candidate!' do
        it 'creates new candidate when registered' do
            candidate1 = @race.register_candidate!({name: "Diana D", party: :democrat})

            expect(candidate1.class).to eq (Candidate)
            expect(candidate1.name).to eq ("Diana D")
            expect(candidate1.party).to eq (:democrat)

            candidate2 = @race.register_candidate!({name: "Roberto R", party: :republican})

            expect(candidate2.class).to eq (Candidate)
            
            expect(@race.candidates).to eq ([candidate1 , candidate2])
        end
    end
end