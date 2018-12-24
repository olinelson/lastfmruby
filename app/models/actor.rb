class Actor < ActiveRecord::Base
  has_many :characters
  has_many :actors, through: :characters

  def full_name
    result = []
    result << self.first_name
    result << self.last_name
    result.join(' ')
  end

  def list_roles
    characters.map do |character|
      "#{character.name} - #{character.show.name}"
    end
  end



end #end oc class
