require 'spec_helper'

describe Guard::I18nJS do
  subject { described_class.new }

  context "#refresh_translations" do
    it 'should call `bundle exec rails runner I18n::JS.export` command if need refresh' do
      subject.should_receive(:system).with("bundle exec rails runner I18n::JS.export").and_return(true)
      subject.send(:refresh_translations).should be_true
    end

    it 'should return false if `bundle exec rails runner I18n::JS.export` command fail' do
      subject.should_receive(:system).with("bundle exec rails runner I18n::JS.export").and_return(false)
      subject.send(:refresh_translations).should be_false
    end

    it 'should call notifier after `bundle exec rails runner I18n::JS.export` command success' do
      subject.stub!(:system).and_return(true)
      Guard::I18nJS::Notifier.should_receive(:notify).with(true, anything())
      subject.send(:refresh_translations)
    end

    it 'should call notifier after `bundle exec rails runner I18n::JS.export` command fail' do
      subject.stub!(:system).and_return(false)
      Guard::I18nJS::Notifier.should_receive(:notify).with(false, anything())
      subject.send(:refresh_translations)
    end
  end

  context "#start" do
    it 'should call #refresh_translations' do
      subject.should_receive(:refresh_translations).and_return(true)
      subject.run_on_additions
    end
  end

  context "#reload" do
    it 'should call #refresh_translations' do
      subject.should_receive(:refresh_translations).and_return(true)
      subject.reload
    end
  end

  context '#run_on_additions' do
    it 'should call #refresh_translations' do
      subject.should_receive(:refresh_translations).and_return(true)
      subject.run_on_additions
    end
  end

  context '#run_on_translation' do
    it 'should call #refresh_translations' do
      subject.should_receive(:refresh_translations).and_return(true)
      subject.run_on_modifications
    end
  end
end
