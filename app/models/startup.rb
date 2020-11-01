class Startup


    attr_accessor :name, :domain
    attr_reader :founder

    @@all = []





    def initialize(name, founder, domain)
        @name = name.to_s
        @founder = founder.to_s
        @domain = domain.to_s 
        @@all << self
    end

    def self.all
        @@all 
    end

    def pivot(domain1, name1)
        self.domain = domain1 
        self.name = name1
    end

    def self.find_by_founder(founder)
        self.all.find do |starts|
            starts.founder == founder 
        end
    end


    def self.domains
        self.all.map do |starts|
            starts.domain
        end
    end

    def sign_contract(vc, type, investment)
        FundingRound.new(self, vc, type, investment)
    end

    def num_funding_rounds
        x = FundingRound.all.select do |fr|
            fr.startup == self 
        end
        return x.count
    end

    def total_funds
      y =[] 
      FundingRound.all.each do |fr|
           if fr.startup == self
            y << fr.investment
           end
      end     
        return y.sum
    end


        #return array of funding rounds for called startup 
    def funding_rounds
        FundingRound.all.select {|fr| fr.startup == self}
    end

    def investors
        funding_rounds.map {|fr| fr.vc}.uniq
    end

    def big_investors
        arr1 = investors.select do |vc|
            VentureCapitalist.tres_commas_club.any?(vc)
        end
        return arr1.uniq
      
    end

end #end of class
