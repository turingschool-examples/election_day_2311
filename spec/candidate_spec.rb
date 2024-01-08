require './lib/candidate'

RSpec.describe Candidate do

    describe "#Initialize" do
        it "exists, has a name, party and starts with no votes" do
            diana = Candidate.new({name: "Diana D", party: :democrat})

            expect(diana).to be_a Candidate
            expect(diana.name).to eq("Diana D")
            expect(diana.party).to eq(:democrat)
            expect(diana.votes).to eq(0)
        end
        it "counts votes" do
            diana = Candidate.new({name: "Diana D", party: :democrat})
            4.times { diana.vote_for! }

            expect(diana.votes).to eq(4)
        end
    end
#     diana = Candidate.new({name: "Diana D", party: :democrat})
# => #<Candidate:0x00007fd83736dbe0...>

# pry(main)> diana.name
# => "Diana D"

# pry(main)> diana.party
# => :democrat

# pry(main)> diana.votes
# => 0

# pry(main)> diana.vote_for!

# pry(main)> diana.vote_for!

# pry(main)> diana.vote_for!

# pry(main)> diana.votes
# => 3

# pry(main)> diana.vote_for!

# pry(main)> diana.votes
# => 4
end