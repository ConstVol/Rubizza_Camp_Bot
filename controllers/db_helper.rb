require '../models/user'
require 'redis'
require 'json'


class Db_Helper

  attr_accessor :redis

  def initialize
    @redis = Redis.new
  end

  def save_user(id, first_name, last_name)
    if @redis.get(id) == nil
      user = User.new(first_name, last_name)
      p user
      @redis.set id, to_json(user)
    end
  end

  def update_user(id, user)
    @redis.set id, to_json(user)
  end

  def get_user(id)
    json_str = JSON.parse(@redis.get(id))
    user = User.new(json_str['name'], json_str['last_name'])
    user.user_steps.steps_add_day = json_str['user_steps']['steps_add_day']
    user.user_steps.steps_add_tasks = json_str['user_steps']['steps_add_tasks']
    user.user_steps.steps_submit_task = json_str['user_steps']['steps_submit_task']
    user.user_steps.steps_submit_time = json_str['user_steps']['steps_submit_time']

    # begin
    #   user.semester.ending_date = Date.parse json_str['semester']['ending_date']
    # rescue ArgumentError
    #   user.semester.ending_date = ''#handle invalid date
    # end

    json_str['hash_of_days'].each do |date, hash_of_tasks|
      day = Working_Day.new
      hash_of_tasks.each do |task_name, status_pair|
        task = Task.new
        task.task_status = status_pair['task_status']
        day.hash_of_tasks[task_name] = task
      end
      user.hash_of_days[date]= day
    end
    user
  end

  def to_json(user)
    hash_tasks = {}
    hash = {}
    user.hash_of_days.each do |date, day|
      day.hash_of_tasks.each do |task_name, task|
        hash_of_tasks[task_name] = {'task_status' => task.task_status}
      end
      hash[date] = hash_tasks
      hash_tasks = {}
    end
    json = {'user_steps' => {'steps_add_day' => user.user_steps.steps_add_day,
                              'steps_add_tasks' => user.user_steps.steps_add_tasks,
                              'steps_submit_task' => user.user_steps.steps_submit_task,
                              'steps_submit_time' => user.user_steps.steps_submit_time},
            'status' => user.status,
            'hash_of_days' => hash,
            'name' => user.name,
            'last_name' => user.last_name}.to_json
    json
  end
end
