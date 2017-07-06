require 'date'

ending_date =  Date.parse '2017.08.31'
curr_time = Time.new
curr_date = Date.parse curr_time.inspect
ending_date = ending_date
days = ( ending_date - curr_date).to_i
month = 0
while days > 30 do
  days -= 30
  month += 1
end

p month
p days