require 'spec_helper'

describe Nard::Appi::Environment do

  contexts = [ :production, :development, :test, :staging, :another ]

  before do
    @environment_instance = Nard::Appi::Environment.instance
  end

  it "has instance method '#to_sym'." do
    expect( @environment_instance ).to respond_to( :to_sym )
  end

  it "has instance method '#update!'." do
    expect( @environment_instance ).to respond_to( :update! )
  end

  it "has instance method '#reset!'." do
    expect( @environment_instance ).to respond_to( :reset! )
  end

  it "has instance method '#development?'." do
    expect( @environment_instance ).to respond_to( :development? )
  end

  it "has instance method '#production?'." do
    expect( @environment_instance ).to respond_to( :production? )
  end

  it "has instance method '#test?'." do
    expect( @environment_instance ).to respond_to( :test? )
  end

  it "has instance method '#staging?'." do
    expect( @environment_instance ).to respond_to( :staging? )
  end

  it "has instance method '#another?' (by method_missing)." do
    expect( @environment_instance ).to respond_to( :another? )
  end

  contexts.each do | context |

    describe "When the environment is '#{ context }'." do

      before do
        @environment_instance.update!( context ) unless context == :production
      end

      it "has instance variable '@env'." do
        expect( :@env ).to be_in( @environment_instance.instance_variables )
        expect( @environment_instance.instance_variable_get( :@env ) ).to be_instance_of( Symbol )
        expect( @environment_instance.instance_variable_get( :@env ) ).to eq( context )
        expect( @environment_instance.instance_variable_get( :@env ) ).to be_frozen
      end

      describe "instance method '#to_sym'" do

        it 'returns environment as a symbol.' do
          expect( @environment_instance.to_sym ).to be_present
          expect( @environment_instance.to_sym ).to be_instance_of( Symbol )
          expect( @environment_instance.to_sym ).to eq( context )
          expect( @environment_instance.to_sym ).to be_frozen
        end

      end

      describe "instance method '#update!'" do

        other_contexts = contexts.reject { | _context | _context == context }

        other_contexts.each do | other_context |

          describe "update env to '#{ other_context }'" do

            describe 'When a symbol is given to this method' do

              before do
                @current_context = @environment_instance.to_sym
                @result = @environment_instance.update!( other_context )
              end

              it 'returns environment as a symbol.' do
                expect( @result ).to be_present
                expect( @result ).to be_instance_of( Symbol )
                expect( @result ).to eq( other_context )
                expect( @result ).to be_frozen

                expect( @environment_instance.to_sym ).to eq( other_context )
              end

              after do
                @environment_instance.update!( @current_context )
              end

            end

            describe 'When a string is given to this method' do

              before do
                @current_context = @environment_instance.to_sym
                @result = @environment_instance.update!( other_context.to_s )
              end

              it 'returns environment as a symbol.' do
                expect( @result ).to be_present
                expect( @result ).to be_instance_of( Symbol )
                expect( @result ).to eq( other_context )
                expect( @result ).to be_frozen

                expect( @environment_instance.to_sym ).to eq( other_context )
              end

              after do
                @environment_instance.update!( @current_context )
              end

            end

          end

        end

      end

      describe "instance method '#reset!'" do

        before do
          @current_context = @environment_instance.to_sym
          @result = @environment_instance.reset!
        end

        it 'returns environment as a symbol.' do
          expect( @result ).to be_present
          expect( @result ).to be_instance_of( Symbol )
          expect( @result ).to eq( :production )
          expect( @result ).to be_frozen

          expect( @environment_instance.to_sym ).to eq( :production )
        end

        after do
          @environment_instance.update!( @current_context )
        end

      end

      describe "instance method '#development?'" do

        before do
          @result = @environment_instance.development?
        end

        case context
        when :development
          it "returns 'true'." do
            expect( @result ).to be( true )
          end
        else
          it "returns 'false'." do
            expect( @result ).to be( false )
          end
        end

      end

      describe "instance method '#production?'" do

        before do
          @result = @environment_instance.production?
        end

        case context
        when :production
          it "returns 'true'." do
            expect( @result ).to be( true )
          end
        else
          it "returns 'false'." do
            expect( @result ).to be( false )
          end
        end

      end

      describe "instance method '#test?'" do

        before do
          @result = @environment_instance.test?
        end

        case context
        when :test
          it "returns 'true'." do
            expect( @result ).to be( true )
          end
        else
          it "returns 'false'." do
            expect( @result ).to be( false )
          end
        end

      end

      describe "instance method '#staging?'" do

        before do
          @result = @environment_instance.staging?
        end

        case context
        when :staging
          it "returns 'true'." do
            expect( @result ).to be( true )
          end
        else
          it "returns 'false'." do
            expect( @result ).to be( false )
          end
        end

      end

      describe "instance method '#another?'" do

        before do
          @result = @environment_instance.another?
        end

        case context
        when :another
          it "returns 'true'." do
            expect( @result ).to be( true )
          end
        else
          it "returns 'false'." do
            expect( @result ).to be( false )
          end
        end

      end

    end

  end

end
