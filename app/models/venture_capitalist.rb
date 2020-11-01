class VentureCapitalist

    attr_reader :name
    attr_accessor :total_worth

    @@all = []

    def initialize(name, total_worth)
        @name = name.to_s 
        @total_worth = total_worth.to_i
        @@all << self
    end

    def self.all
        @@all
    end

    def self.tres_commas_club
        self.all.select do |vc|
            vc.total_worth > 999_999_999
        end
    end

    def offer_contract(startup1, type1 = nil, investment1 = nil)
        FundingRound.new(startup1, self, type1, investment1)
    end

    def funding_rounds
        FundingRound.all.select {|fr| fr.vc == self}

    end
    
    def portfolio
        funding_rounds.map {|fr| fr.startup}.uniq

    end

    def biggest_investment
        funding_rounds.max_by do |fr|
            fr.investment
        end
    end

     def invested(domain1)
        total = 0
         funding_rounds.each do |fr|
            if fr.startup.domain == domain1
                total += fr.investment
            end
         end
               return total  

     end

end #end of Class
