require 'date'
class Status

  def initialize
    @ending_date = Date.parse '2017.08.31'
  end

  def execute_command(user)
    #user.user_status.steps_semester['set_ending_date'] = true
    #user

    days_left = time_left
    "You have to survive #{days_left} more days!
     You have already gone through #{hours} hours of suffering,
     completed #{completed_task}/#{all_tasks}
     and was the hero of the day #{times} times!
     Hold on, #{user.name}! "


  end

  def time_left
    curr_time = Time.new
    curr_date = Date.parse curr_time.inspect
    ending_date = @ending_date
    days = ( ending_date - curr_date).to_i

  end
end
