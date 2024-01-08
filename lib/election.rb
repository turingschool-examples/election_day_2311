class Election

    attr_reader :year,
                :races

    def initialize(year)
        @year = year
        @races = []
        @candidate_votes = {}
    end

    def add_race(race)
        races << race
    end

    def candidates
        all_candidates = []
        @races.each do |race|
            all_candidates << race.candidates
        end
        all_candidates.flatten
        
    end

    def vote_counts
        candidates.each do |candidate|
            @candidate_votes[candidate.name] = candidate.votes
        end
        @candidate_votes
    end
end
