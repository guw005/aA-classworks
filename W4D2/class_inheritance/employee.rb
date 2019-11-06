class Employee
  attr_reader :name, :title, :salary, :boss
  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end
  
  def bonus(multiplier)
    salary* multiplier
  end
end

class Manager < Employee
  attr_reader :employee
  def initialize(name,title,salary,boss,employee=[])
    super(name, title, salary,boss)
    @employee = employee
  end

  def bonus(multiplier)
    # return self.salary unless self.is_a?(Manager)
    # sum = 0
    # @employee.each do |emp|
    #   if !self.is_a?(Manager)
    #   sum += emp.bonus(multiplier)
    #   else
    #     sum 
    # end
    total_salary * multiplier
    
    # total = 0
    # @employee.each do |emp|
    #   total += emp.salary
    # end
    # return total * multiplier
  end

  def total_salary
    total = 0
    @employee.each do |emp|
      if emp.is_a?(Manager)
        total += emp.total_salary
      end
        total += emp.salary
    end
    total
  end
end