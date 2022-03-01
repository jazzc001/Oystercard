class Journey
  def initialize
    @entry_station = nil
    @exit_station = nil
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
end