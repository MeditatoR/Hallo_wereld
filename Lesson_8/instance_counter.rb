module InstanceCounter
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    attr_accessor :i_counter

    def new_instance
      @i_counter ||= 0
      self.i_counter += 1
    end

    def instances
      self.i_counter
    end
  end

  module InstanceMethods
    protected

    def register_instance
      self.class.new_instance
    end
  end
end
