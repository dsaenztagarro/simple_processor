require 'ruby-progressbar'

module SimpleProcessor
  # Class for processing records in batches
  class BatchProcessor
    def self.processor_handlers(*handlers_args)
      define_method :handlers do
        @handlers ||= handlers_args.map do |handler|
          handlers_module.const_get(handler.to_s.camelize).new
        end
      end
    end

    def self.processor_model(klass)
      define_method :model_klass do
        klass
      end
    end

    # @param [Hash] opts The options to create a processor
    # @option opts [ActiveRecord::Migration] :ar_migration The active record
    #   migration instantiating the processor. Allows additional console info
    def initialize(opts = {})
      @ar_migration = opts[:ar_migration]
    end

    # Executes the batch processing over all stories
    def run
      init_counters
      @bar = ::ProgressBar.create(total: model_klass.count,
                                  format: '%t: |%w| [%E]')
      model_klass.find_in_batches { |model| process_batch(model) }
      show_resume
    end

    private

    def handlers_module
      klass = self.class
      path_list = klass.to_a.each_with_index.map do |x, i|
        x if i < klass.index_processors_module
      end
      path_list.compact.join('::').concat('::Handlers').constantize
    end

    def self.index_processors_module
      to_a.find_index('Processors')
    end

    def self.to_a
      to_s.split('::')
    end

    # Process a batch of models
    # @param stories [Array<Story>] array of stories
    def process_batch(models)
      models.each do |model|
        @bar.increment
        process(model)
      end
    end

    # Process a model
    # @param model [Story] story The model instance
    def process(model)
      handlers.each { |handler| handler.apply(model) }
      @success += 1
    rescue => error
      say "ERROR: Story ##{model.id} #{error.message}"
      @errors += 1
    end

    def show_resume
      say "#{@success} stories updated. #{@errors} errors"
    end

    # Shows a message in console during migration execution
    # @param message [String]
    def say(message)
      @ar_migration.say message if @ar_migration
    end

    def init_counters
      @success = 0
      @errors = 0
    end
  end
end
