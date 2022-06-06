require './lib/activity'

RSpec.describe Activity do
  before(:each) do
    @activity = Activity.new("Brunch")
  end

  it 'has a name' do
    expect(@activity.name).to eql('Brunch')
  end

  it 'has no participants by default' do
    expect(@activity.participants).to eql({})
  end

  it 'adds a participant' do
    @activity.add_participant('Maria', 20)
    expect(@activity.participants).to eql({"Maria" => 20})
    @activity.add_participant("Luther", 40)
    expect(@activity.participants).to eql({"Maria" => 20, "Luther" => 40})
  end

  it 'calculates the total amount paid of all participants' do
    @activity.add_participant('Maria', 20)
    expect(@activity.total_cost).to eql(20)
    @activity.add_participant("Luther", 40)
    expect(@activity.total_cost).to eql(60)
  end

end
