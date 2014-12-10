require 'spec_helper'

module BatchProcessorTest
  class Processor < ::SimpleProcessor::BatchProcessor
    processor_handlers :handler1, :handler2
    processor_model Model
  end

  class BaseHandler
    def apply(model)
      # Handler stuff here
    end
  end

  class Handler1 < BaseHandler
  end

  class Handler2 < BaseHandler
  end
end

describe SimpleProcessor::BatchProcessor do

  describe '#run' do
    let(:models) { [double, double, double] }

    it 'applies handler on all models' do
      handlers = [BatchProcessorTest::Handler1, BatchProcessorTest::Handler2]
      handlers.product(models).each do |handler, model|
        expect_any_instance_of(handler).to receive(:apply).with(model)
      end
      subject.run
    end
  end
end
