require 'spec_helper'

RSpec.describe BaseService, type: :service do
  class DummyModel
    def initialize(params)
    end
  end

  class DummyService < BaseService
    def execute
      dummy_model = DummyModel.new(@params)
      dummy_model.save
      @errors = dummy_model.errors
      @data = dummy_model
    end
  end

  context 'DummyService' do
    subject { service.authorized_by(current_user).invoke }

    let(:params) { {} }
    let(:current_user) { double('current_user') }
    let(:service) { DummyService.new(params) }
    let(:valid) { true }
    let(:errors) { [] }
    let(:dummy_model) { double('dummy_model') }

    before do
      expect(DummyModel).to receive(:new).with(params).and_return(dummy_model)
      expect(dummy_model).to receive(:save).and_return(valid)
      expect(dummy_model).to receive(:errors).and_return(errors)
    end

    it { expect(subject).to be_an_instance_of(ServiceResponse) }
    it { expect(subject.data).to eq(dummy_model) }

    context 'result is valid' do
      it { expect(subject.success?).to be_truthy }
      it { expect(subject.errors).to be_blank }
    end

    context 'result is invalid' do
      let(:valid) { false }
      let(:errors) { double('errors') }

      it { expect(subject.success?).to be_falsy }
      it { expect(subject.errors).to eq(errors) }
    end
  end
end
