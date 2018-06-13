require_relative( '../db/sql_runner' )

class GymClass

attr_reader :id
attr_accessor :title, :description, :teacher, :cost, :duration, :class_time, :capacity

def initialize(options)
  @id = options['id'].to_i if options['id']
  @title = options['title']
  @description = options['description']
  @teacher = options['teacher']
  @cost = options['cost'].to_i
  @duration = options['duration'].to_i
  @class_time = options['class_time']
  @capacity = options['capacity'].to_i
end

  #Create a new class for the gym
  def save()
    sql = "INSERT INTO gym_classes(title, description, teacher, cost, duration, class_time, capacity) VALUES ($1, $2, $3, $4, $5, $6, $7) RETURNING id"
    values = [@title, @description, @teacher, @cost, @duration, @class_time, @capacity]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  #Return all classes available at the gym
  def self.all()
    sql = "SELECT * FROM gym_classes"
    results = SqlRunner.run(sql)
    return results.map { |gym_class| GymClass.new(gym_class)}
  end

  #Returns one class
  def self.find(id)
    sql = "SELECT * FROM gym_classes WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return GymClass.new(results.first)
  end

  #Update details about a class
  def update()
    sql = "UPDATE gym_classes SET (title, description, teacher, cost, duration, class_time, capacity) = ($1, $2, $3, $4, $5, $6, $7) WHERE id = $8"
    values = [@title, @description, @teacher, @cost, @duration, @class_time, @capacity, @id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM gym_classes"
    SqlRunner.run (sql)
  end

  #Can delete a class that is perhaps no longer available
  def self.delete(id)
    sql = "DELETE FROM gym_classes WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end

  #Method to return all members booked into a class
  def members()
    sql = "SELECT members.* FROM members INNER JOIN bookings ON bookings.member_id = members.id INNER JOIN gym_classes ON bookings.gym_class_id = gym_classes.id WHERE gym_classes.id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map { |member| Member.new(member)}
  end

end
