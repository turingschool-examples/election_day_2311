require './lib/candidate'
require './lib/race'
require './lib/election'

RSpec.describe Election do
    describe "#Initialize" do
        it "exists and has a year" do
            election = Election.new("2024")

            expect(election).to be_a Election
            expect(election.year.class).to eq(String)
            expect(election.year).to eq("2024")
        end
        it "starts with no races" do
            election = Election.new("2024")

            expect(election.races).to eq([])
        end
    end
    describe "#races" do
        it "adds races correctly" do
            race = Race.new("Texas Governor")
            election = Election.new("2024")
            candidate1 = race.register_candidate!({name: "Diana D", party: :democrat})
            candidate2 = race.register_candidate!({name: "Roberto R", party: :republican})
            election.add_race(race)

            expect(election.races.class).to eq(Array)
            expect(election.races[0].class).to eq(Race)
            expect(election.candidates).to eq([candidate1, candidate2])
        end
    end
    describe "#votes" do
        it "counts votes" do
            race = Race.new("Texas Governor")
            election = Election.new("2024")
            candidate1 = race.register_candidate!({name: "Diana D", party: :democrat})
            candidate2 = race.register_candidate!({name: "Roberto R", party: :republican})
            3.times {candidate1.vote_for!}
            7.times {candidate2.vote_for!}
            election.add_race(race)

            expect(election.vote_counts).to eq({"Diana D" => 3, "Roberto R" => 7})
        end
    end
end