require 'spec_helper'

describe Nard::Appi do

  describe '[Version]' do

    before do
      Nard::Appi.module_eval do
        include Nard::Appi::ApiExt::Version
      end
    end

    it "has constant 'VERSION'." do
      expect( Nard::Appi::VERSION ).to be_present
      expect( Nard::Appi::VERSION ).to be_instance_of( String )
      expect( Nard::Appi::VERSION ).to eq( '0.2.2' )
      expect( Nard::Appi::VERSION ).to be_frozen
    end

    it "has class method '.#gem_version'." do
      expect( Nard::Appi ).to respond_to( :gem_version )
    end

    describe '.#gem_version (see also: Nard::Appi::ApiExt::Version)' do

      it 'returns version of this gem.' do
        expect( Nard::Appi.gem_version ).to be_present
        expect( Nard::Appi.gem_version ).to be_instance_of( String )
        expect( Nard::Appi.gem_version ).to eq( Nard::Appi::VERSION )
        expect( Nard::Appi.gem_version ).to be_frozen
      end

    end

  end

  describe '[Client]' do

    before do
      Nard::Appi.module_eval do
        include Nard::Appi::ApiExt::Client
      end
    end

    it "has class method '.#client'." do
      expect( Nard::Appi ).to respond_to( :client )
    end

  end

  describe '[Environment]' do

    before do
      Nard::Appi.module_eval do
        include Nard::Appi::ApiExt::Environment
      end

      Nard::Appi.env.reset!
    end

    it "has class method '.#environment'." do
      expect( Nard::Appi ).to respond_to( :environment )
    end

    describe "class method '.#environment'" do

      it 'returns a symbol.' do
        expect( Nard::Appi.environment ).to be_present
        expect( Nard::Appi.environment ).to be_instance_of( Symbol )
        expect( Nard::Appi.environment ).to eq( :production )
        expect( Nard::Appi.environment ).to be_frozen
      end

    end

    it "has class method '.#env'." do
      expect( Nard::Appi ).to respond_to( :env )
    end

    describe "class method '.#env'" do

      it 'returns an instance of Nard::Appi::Environment.' do
        expect( Nard::Appi.env ).to be_present
        expect( Nard::Appi.env ).to be_instance_of( Nard::Appi::Environment )
        # expect( Nard::Appi.env ).to be_frozen
      end

    end

    it "has class method '.#environment='." do
      expect( Nard::Appi ).to respond_to( :environment= )
    end

    describe "class method '.#environment=' (alias of .#env)" do

      before do
        @result = ( Nard::Appi.environment = :development )
      end

      it 'sets new environment and returns a symbol.' do
        expect( @result ).to be_present
        expect( @result ).to be_instance_of( Symbol )
        expect( @result ).to eq( :development )
        expect( @result ).to be_frozen
      end

      after do
        Nard::Appi.environment = :production
      end

    end

    it "has class method '.#env='." do
      expect( Nard::Appi ).to respond_to( :env= )
    end

    describe "class method '.#env='" do

      before do
        @result = ( Nard::Appi.env = :development )
      end

      it 'sets new environment and returns a symbol.' do
        expect( @result ).to be_present
        expect( @result ).to be_instance_of( Symbol )
        expect( @result ).to eq( :development )
        expect( @result ).to be_frozen
      end

      after do
        Nard::Appi.env = :production
      end

    end

  end

end
