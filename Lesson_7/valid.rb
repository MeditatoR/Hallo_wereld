module Valid

  def valid?
    validate!
    rescue RuntimeError
    false
  end
end
