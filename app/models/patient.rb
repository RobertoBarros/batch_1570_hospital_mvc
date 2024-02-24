class Patient
  attr_reader :name, :age
  attr_accessor :id, :room

  def initialize(attributes = {})
    @id = attributes[:id]
    @name = attributes[:name]
    @age = attributes[:age]
  end

end

# roberto = Patient.new({age: 30, name: 'Roberto Barros'})


# roberto = Patient.new(age: 30, name: 'Roberto Barros')
# room42 = Room.new(number: 42, capacity: 3)

# roberto.room = room42

# roberto.room # => room42
