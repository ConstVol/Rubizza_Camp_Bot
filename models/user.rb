require '../controllers/user_steps'
require '../models/status'
require '../models/working_day'

class User

  attr_accessor :status, :hash_of_days, :user_steps, :name, :last_name

  def initialize(first_name, last_name)
    @status = Status.new
    @hash_of_days = {}
    @user_steps = User_Steps.new
    @name = first_name
    @last_name = last_name
    @suffered_hours = 0
    @all_tasks = 0

  end

end