# frozen_string_literal: true

module ApplicationHelper
  def devise_form_for(object, *args, &)
    form_options = { data: { turbo: false } }
    options = args.extract_options!.dup
    simple_form_for(object, *(args << options.merge(form_options)), &)
  end
end
