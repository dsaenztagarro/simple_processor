require_relative '../../../app/models/concept'

module Hola
  module Processors
    class ConceptProcessor < ::SimpleProcessor::BatchProcessor
      processor_handlers :process1_handler, :process2_handler
      processor_model Concept
    end
  end
end
