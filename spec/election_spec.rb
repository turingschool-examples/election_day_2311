require './lib/candidate'
require './lib/race'
require './lib/election'

RSpec.describe Election do
    before(:each) do
        @election = Election.new("2024")
        @race = Race.new("Texas Governor")
        @diana = Candidate.new({name: "Diana D", party: :democrat})
        @roberto = Candidate.new({name: "Roberto R", party: :republican})
    end
    describe 'election' do
      it 'is an election' do
        expect(@election).to be_an_instance_of (Election)
      end
  
      it 'has a year' do
        expect(@election.year).to eq ("2024")
      end

      it 'has candidates' do
        expect(@election.races).to eq ([])
      end
    end

    describe 'races' do
        it 'add races' do
            @election.add_race(@race)
            expect(@election.races).to eq ([@race])
        end

        it 'has candidates after adding races' do
            candidate1 = @race.register_candidate!({name: "Diana D", party: :democrat})

            candidate2 = @race.register_candidate!({name: "Roberto R", party: :republican})

            @election.add_race(@race)

            expect(@election.candidates).to eq ([candidate1 , candidate2])
        end
    end

  describe '#vote_counts' do

    it 'is the candidate name with their amount of votes' do
      
      candidate1 = @race.register_candidate!({name: "Diana D", party: :democrat})

      candidate2 = @race.register_candidate!({name: "Roberto R", party: :republican})

      candidate1.vote_for!
      candidate2.vote_for!
      candidate2.vote_for!
      expect(candidate1.votes).to eq (1)
      expect(candidate2.votes).to eq (2)

      @election.add_race(@race)
      expect(@election.candidates).to eq ([candidate1 , candidate2])
      
      expect(@election.vote_counts).to eq ({
        candidate1.name => candidate1.votes,
        candidate2.name => candidate2.votes
      })
    end
  end
end