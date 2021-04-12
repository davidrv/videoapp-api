class BaseService
  def self.call(*args)
    new(*args).call
  end

  def respond!
    { model: model, result: result, errors: errors }
  end

  def success?
    result
  end

  private

    def result
      @result || false
    end

    def model
      @model || nil
    end

    def errors
      @errors || []
    end
end
