class TempUser
  attr_reader :name, :email, :id
  def initialize(hash = {})
    @name = hash[:name]
    @email = hash[:email]
    @id = hash[:id]
  end
end
