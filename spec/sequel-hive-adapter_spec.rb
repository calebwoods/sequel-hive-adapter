require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "SequelHiveAdapter" do

  before(:all) do
    TEST_HOST = "172.16.87.131"  # CDH3 Demo VM
    @testdb = Sequel.connect("hive://#{TEST_HOST}")
    @testtable = :test_test_test
    @sampletable = :pokes
    @sampledb = @testdb[ @sampletable ]
  end

  it "should load" do
    @testdb.should be_an_instance_of Sequel::Hive::Database
  end

  pending "should create and drop tables" do
    @testdb.create_table @testtable do
      column :name, :string
      column :num, :integer
    end
  end

  it "should list tables as symbols" do
    res = @testdb.tables
    res.each do |r|
      r.should be_a Symbol
    end
  end

  it "should list table schemas" do
  end

  it "should list table columns" do
    @sampledb.columns.should == [:foo, :bar]
  end

  it "should return the value for one column" do
    @sampledb.select(:foo).first.should == {:foo => 5}
  end
  

  pending "should convert string columns to strings" do
  end

  pending "should handle group and count" do
  end
end
