require_relative '../../app/models/concept'

module Processors
  class InvalidHandlerProcessor < ::SimpleProcessor::BatchProcessor
    processor_handlers :process1_handler, :unknown_handler
    processor_model Concept
  end
end
