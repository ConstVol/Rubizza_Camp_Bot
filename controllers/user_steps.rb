class User_Steps

  attr_accessor :steps_submit_task, :steps_submit_time, :steps_add_day, :steps_add_tasks, :steps_submit_hero

  def initialize
    @steps_add_day     = {'setting_date' => false, 'relevant_date' => ''}
    @steps_add_tasks   = {'choosing_day' => false, 'relevant_day' => '', 'setting_task' => false}
    @steps_submit_task = {'choosing_day' => false, 'relevant_day' => '', 'choosing_task' => false}
    @steps_submit_time = {'choosing_day' => false, 'relevant_day' => '', 'setting_time' => false}
  end

end