class Member

  attr_reader :id
  attr_accessor :first_name, :last_name, :membership_type, :date_of_birth

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
    @membership_type = options['membership_type']
    @date_of_birth = options['date_of_birth']
  end

#Create a new member of the gym
  def save()
    sql = "INSERT INTO members(first_name, last_name, membership_type, date_of_birth) VALUES ($1, $2, $3, $4) RETURNING id"
    values = [@first_name, @last_name, @membership_type, @date_of_birth]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  #Return all members of the gym
  def self.all()
    sql = "SELECT * FROM members"
    results = SqlRunner.run(sql)
    return results.map { |member| Member.new(member)}
  end

  #Returns a particular member of the gym
  def self.find(id)
    sql = "SELECT * FROM members WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return Member.new(results.first)
  end

  #Update details about a member
  def update()
    sql = "UPDATE members SET (first_name, last_name, membership_type, date_of_birth) = ($1, $2, $3, $4) WHERE id = $5"
    values = [@first_name, @last_name, @membership_type, @date_of_birth]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM members"
    SqlRunner.run (sql)
  end

  #Can delete a member from the gym, wont probably be used.
  def delete(id)
    sql = "DELETE FROM members WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end



end
