require 'spec_helper'

module Imagga
  describe Categorization do

    describe '.app_key' do
      it 'should return default key' do
        Categorization.app_key.should == Categorization::Configuration::DEFAULT_APP_KEY
      end
    end

    describe '.user_agent' do
      it 'should return default user agent' do
        Categorization.user_agent.should == Categorization::Configuration::DEFAULT_USER_AGENT
      end
    end

    after do
      Categorization.reset
    end

    describe '.configure' do
      Categorization::Configuration::VALID_CONFIG_KEYS.each do |key|
        describe ".#{key}" do
          it 'should return the default value' do
            Categorization.send(key).should == Categorization::Configuration.const_get("DEFAULT_#{key.upcase}")
          end
        end
      end
    end

  end
end