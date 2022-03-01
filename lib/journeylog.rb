class JourneyLog 
  
  def initialize(journey)
    @journeys = journey
    @current_journey = nil
  end


  def journeys
    return_array = []
    @journeys.each do |journey|
      return_array << journey.show_journey
    end
    return return_array
  end

  def in_journey
    return @current_journey ? true : false
  end

  
  def start_journey(entry_station)
    @entry_station = entry_station
  end

  def finish_journey(exit_station)
    @exit_station = exit_station
  end

  def show_journey
    return "Entry station is #{@entry_station}. Exit station is #{@exit_station}"
  end
  def calculate_fare

  end

  def entry_station
    return @entry_station
  end

  def exit_station
    return @exit_station
  end

  def in_journey?
    @entry_station ? true : false
  end

  private


  def save_journey
    @journeys << @current_journey
  end

end