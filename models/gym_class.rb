require_relative( '../db/sql_runner' )

class GymClass

attr_reader :id
attr_accessor :title, :description, :teacher, :cost, :duration

def initialize(options)
  @id = options['id'].to_i if options['id']
  @title = options['title']
  @description = options['description']
  @teacher = options['teacher']
  @cost = ['cost']
  @duration = ['duration']
end

#Create a new class for the gym
  def save()
    sql = "INSERT INTO gym_classes(title, description, teacher, cost, duration) VALUES ($1, $2, $3, $4, $5) RETURNING id"
    values = [@title, @description, @teacher, @cost, @duration]
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
    sql = "UPDATE gym_classes SET (title, description, teacher, cost, duration) = ($1, $2, $3, $4, $5) WHERE id = $6"
    values = [@title, @description, @teacher, @cost, @duration]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM gym_classes"
    SqlRunner.run (sql)
  end

  #Can delete a class that is perhaps no longer available
  def delete(id)
    sql = "DELETE FROM gym_classes WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end


end
