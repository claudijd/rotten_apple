shared_examples_for "a non-zero length string" do
  subject {@string}

  it "should return an string" do
    subject.should be_kind_of(::String)
  end

  it "should return a non-zero length string" do
    subject.length.should > 0
  end

end

shared_examples_for "a non-zero length array" do
  subject {@array}

  it "should return an array" do
    subject.should be_kind_of(::Array)
  end

  it "should return a non-zero length array" do
    subject.length.should > 0
  end

end