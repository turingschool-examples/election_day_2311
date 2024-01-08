class Candidate

    attr_reader :party,
                :name,
                :votes

    def initialize(info)
        @name = info[:name]
        @party = info[:party]
        @votes = 0
    end

    def vote_for!
        @votes += 1
    end
end
