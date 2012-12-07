# encoding: utf-8
require 'spec_helper'

describe Guard::I18nJS::Notifier do
  subject { Guard::I18nJS::Notifier }

  it 'should format success message' do
    message = subject.guard_message(true, 10.1)
    message.should == "I18n::JS translations has been exported\nin 10.1 seconds."
  end

  it 'should format fail message' do
    message = subject.guard_message(false, 10.1)
    message.should == "I18n::JS translations can't be exported,\nplease check manually."
  end

  it 'should select success image' do
    subject.guard_image(true).should == :success
  end

  it 'should select failed image' do
    subject.guard_image(false).should == :failed
  end

  it 'should call Guard::Notifier' do
    ::Guard::Notifier.should_receive(:notify).with(
      "I18n::JS translations has been exported\nin 10.1 seconds.",
      :title => 'I18n::JS export',
      :image => :success
    )
    subject.notify(true, 10.1)
  end

end
