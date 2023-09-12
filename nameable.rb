class Nameable
  def correct_name
    raise NotImplementedError, "#{self.class} has no implemention '#{__method__}'"
  end
end
