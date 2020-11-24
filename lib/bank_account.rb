class BankAccount
    
    attr_accessor :balance, :status
    attr_reader :name

    def initialize(name)
        @name = name
        @balance = 1000
        @status = "open"
    end

    def deposit(amount)
        self.balance += amount
    end

    def display_balance
        "Your balance is $#{self.balance}."
    end

    def valid? # is valid with an open status and a balance greater than 0
        self.balance > 0 && self.status == "open"       
    end

    def close_account
        self.status = "closed"
    end

end
