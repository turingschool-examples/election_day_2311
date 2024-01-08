class Race

    attr_reader :office,
                :candidates

    def initialize(office)
        @office = office
        @candidates = []
    end

    def register_candidate!(info)
        new_candidate = Candidate.new(info)
        @candidates << new_candidate
        return new_candidate
    end
end
