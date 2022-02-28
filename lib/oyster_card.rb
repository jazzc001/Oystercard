MAX_MONEY = 10
class OysterCard
  attr_reader :balance, :MINIMUM_FARE, :entry_station
  def initialize(balance=0)
    @balance = balance
    @MAX_MONEY = 90
    @in_journey = false
    @MINIMUM_FARE = 1
    @entry_station = ""
  end

  def touch_in(station="")
    balance_over_minimum?
    @entry_station = station
    @in_journey = true
  end

  def touch_out
    deduct(@MINIMUM_FARE)
    @in_journey = false
  end

  def in_journey?
    return @in_journey
  end

  def top_up(money)
    @balance += money unless exceeds_maximum?(money)
  end

  private

  def exceeds_maximum?(money)
    #checks if adding the current balance to the top up value would exceed the maximum money
    if @balance + money > @MAX_MONEY
      raise Exception.new "limit is #{@MAX_MONEY} the maximum top up you can make is #{@MAX_MONEY-@balance}"
    end
  end

  def balance_over_minimum?
    @balance > @MINIMUM_FARE ? true : (raise Exception.new "balance not greater than minimum, add at least #{@MINIMUM_FARE - @balance}")
  end

  def deduct(money)
    @balance -= money
  end

  # def balance
  #   return @balance
  # end
end

# oyster_card = OysterCard.new
# oyster_card.top_up(10)
# oyster_card.touch_in