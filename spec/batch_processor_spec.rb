require 'spec_helper'

describe 'SimpleProcessor::BatchProcessor' do

  describe '#run' do
    let!(:models) { create_list :concept, 3 }

    it 'applies handlers on all models' do
      handlers = [Handlers::Process1Handler, Handlers::Process2Handler]
      handlers.product(models).each do |handler, model|
        expect_any_instance_of(handler).to receive(:apply).with(model)
      end
      Processors::ConceptProcessor.new.run
    end

    it 'raises an error on unknown handler class' do
      expect {
        Hola::Processors::InvalidHandlerProcessor.new.run
      }.to raise_error
    end
  end
end
