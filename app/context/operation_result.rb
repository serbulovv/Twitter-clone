class OperationResult
  attr_reader :success, :errors, :object

  def initialize(success, obj, errors = [])
    @success = success
    @errors = errors
    @object = obj
  end

  def success?
    @success
  end

  def failure?
    !@success
  end

  def parse_errors
    errors_list = []
    @errors.errors.to_h.each do |field, messages|
      messages.each { |message| errors_list << "#{field} #{message}" }
    end
    errors_list.join(",")
  end
end
