require '../models/task'

class Working_Day
  attr_accessor :date, :hash_of_tasks, :suffered_hours

  def initialize
    @hash_of_tasks = {}
    @suffered_hours = 0
  end

end