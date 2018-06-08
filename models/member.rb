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

end
