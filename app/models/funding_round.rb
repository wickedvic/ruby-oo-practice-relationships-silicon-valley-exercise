class FundingRound

    attr_reader :startup, :vc
    attr_accessor :type, :investment    

    @@all = []

    def initialize(startup, vc, type = nil, investment = 0 )
        @startup = startup
        @vc = vc
        @type = type.to_s
        @investment = investment.to_f
        @@all << self
    end

    def self.all 
        @@all
    end




end #end of class
