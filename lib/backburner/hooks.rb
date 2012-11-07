module Backburner
  module Hooks
    # Triggers all method hooks that match the given event type with specified arguments.
    #
    # @example
    #   invoke_hook_events(:before_enqueue, 'some', 'args')
    #   invoke_hook_events(:after_perform, 5)
    #
    # TODO TEST
    def invoke_hook_events(event, *args, &block)
      events = (self.methods - Object.methods).grep(/^#{event}/).sort
      events.map { |e| send(e, *args, &block) }
    end
  end # Hooks
end # Backburner