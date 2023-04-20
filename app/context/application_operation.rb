require_relative "operation_result"

class ApplicationOperation
  def Validate(class_name, params)
    class_name.new.call(params.to_unsafe_hash)
  end

  def Create
  end

  def Update
  end

  def Save
  end
end
