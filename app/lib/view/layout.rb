class Layout
  include Draper::ViewHelpers
  def body_id
    "#{h.controller_name}_#{h.action_name}"
  end
end
