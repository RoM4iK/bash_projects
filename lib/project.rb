class Project
  attr_accessor :name, :dir, :id
  def initialize(name, dir)
    self.name = name
    self.dir = dir
  end

  def to_s
%{
  Project \##{id}
    name: #{name}
    directory: #{dir}}
  end
end
