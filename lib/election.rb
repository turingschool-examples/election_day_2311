class Election
    attr_reader :year,
                :races,
                :election_candidates

    def initialize(year)
        @year = year
        @races = []
        @election_candidates = []
    end

    def add_race(race)
        @races << race
        @races
    end

    def candidates
        @races.map {|race| @election_candidates << race.candidates}
        @election_candidates = @election_candidates.flatten!
    end

    def vote_counts
        vote_count = {}
        candidates
        @election_candidates.each do |candidate|
            vote_count[candidate.name] = candidate.votes
        end
        vote_count
    end
end
