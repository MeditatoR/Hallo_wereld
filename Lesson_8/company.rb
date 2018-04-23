module Company
  attr_accessor :company_name

  def attach_company_name(name)
    self.company_name = name
  end

  def show_company_name
    puts "Название компании-производителя - #{company_name}"
  end
end
