describe Link do
  it { should belong_to :user}
  it { should validate_presence_of :title }
  it { should validate_presence_of :url }
  it { should have_many :votes }
  it { should have_many :comments }
end
