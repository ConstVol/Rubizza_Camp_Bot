require '../models/user'
require '../commands/start_c'
require '../commands/add_day'
require '../commands/add_task'
require '../commands/status_c'
require '../commands/submit_hours'
require '../commands/submit_task'
require '../commands/submit_hero'
require '../controllers/db_helper'

class User_Manager

  def initialize
    @db_helper = Db_Helper.new
    @hash_of_users = {}
    @add_day = Add_Day.new
    @add_task = Add_Task.new
    @start_c = Start_c.new
    @status_c = Status_c.new
    @submit_hours = Submit_Hours.new
    @submit_task = Submit_Task.new
    @submit_hero = Submit_Hero.new
  end

  def check_user(first_name, last_name, id)
    p 'zalupa'
    @db_helper.save_user(id, first_name, last_name)
  end

  def get_user(id)
    p "apu"
    user = @db_helper.get_user(id)
    user
  end
  @steps_add_day     = {'setting_date' => false, 'relevant_date' => ''}
  @steps_add_tasks   = {'choosing_day' => false, 'relevant_day' => '', 'setting_task' => false}
  @steps_submit_task = {'choosing_day' => false, 'relevant_day' => '', 'choosing_task' => false}
  @steps_submit_time = {'choosing_day' => false, 'relevant_day' => '', 'setting_time' => false}

  def update_steps(id)
    user =  @db_helper.get_user(id)
    user.user_steps.steps_add_day['setting_date'] = false
    user.user_steps.steps_add_tasks['choosing_day'] = false
    user.user_steps.steps_add_tasks['setting_task'] = false
    user.user_steps.steps_submit_task['choosing_day'] = false
    user.user_steps.steps_submit_task['choosing_task'] = false
    user.user_steps.steps_submit_time['choosing_day'] = false
    user.user_steps.steps_submit_time['setting_time'] = ''
    @db_helper.update_user(id, user)
  end

  def execute_start(first_name)
    @start_c.execute_command first_name
  end


end