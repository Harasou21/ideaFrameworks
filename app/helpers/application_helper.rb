module ApplicationHelper
  def display_error_messages(model,attribute)
    model.errors.full_messages_for(attribute).each do |error|
      @error = error
    end
    @error
  end
end
