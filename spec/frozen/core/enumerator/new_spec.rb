require File.expand_path('../../../spec_helper', __FILE__)

ruby_version_is "1.8.7" do
  require File.expand_path('../../../shared/enumerator/new', __FILE__)

  describe "Enumerator.new" do
    it_behaves_like(:enum_new, :new)

    ruby_version_is "1.8.8" do
      it "accepts a block" do
        enum = enumerator_class.new do |yielder|
          yielder.yield 3
          yielder.yield 2
          yielder.yield 1
        end
        enum.should be_an_instance_of(enumerator_class)
        enum.to_a.should == [3,2,1]
      end

      it "ignores block if arg given" do
        enum = enumerator_class.new([1,2,3]){|y| y.yield 4}
        enum.to_a.should == [1,2,3]
      end
    end
  end
end
