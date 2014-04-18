require 'spec_helper'

module Imagga
  describe Categorization::Client do

    before do
      @keys = Categorization::Configuration::VALID_CONFIG_KEYS
    end

    describe 'with module configuration' do
      before do
        Categorization.configure do |config|
          @keys.each do |key|
            config.send("#{key}=", key)
          end
        end
      end

      after do
        Categorization.reset
      end

      it "should inherit module configuration" do
        api = Categorization::Client.new
        @keys.each do |key|
          api.send(key).should == key
        end
      end

      describe 'with class configuration' do
        before do
          @config = {
            :app_key    => 'ak',
            :endpoint   => 'ep',
            :user_agent => 'ua',
          }
        end

        it 'should override module configuration' do
          api = Categorization::Client.new(@config)
          @keys.each do |key|
            api.send(key).should == @config[key]
          end
        end

        it 'should override module configuration after' do
          api = Categorization::Client.new

          @config.each do |key, value|
            api.send("#{key}=", value)
          end

          @keys.each do |key|
            api.send("#{key}").should == @config[key]
          end
        end

      end
    end

    describe 'POST classify' do
      it 'should have a classify method' do
        client = Categorization::Client.new
        client.should be_respond_to(:classify)
      end

      it "must parse the api response from JSON to Hash" do
        client = Categorization::Client.new
        client.classify('test').should be_instance_of Hash
      end
    end

    describe 'GET classify result' do
      it 'should have a classify_result method' do
        client = Categorization::Client.new
        client.should be_respond_to(:classify_result)
      end

      it "must parse the api response from JSON to Hash" do
        client = Categorization::Client.new
        client.classify_result('ticket_id').should be_instance_of Hash
      end
    end

    describe 'GET tasks result' do
      it 'should have a tasks method' do
        client = Categorization::Client.new
        client.should be_respond_to(:tasks)
      end

      it "must parse the api response from JSON to Hash" do
        client = Categorization::Client.new
        client.classify_result('task_id').should be_instance_of Hash
      end
    end

  end
end