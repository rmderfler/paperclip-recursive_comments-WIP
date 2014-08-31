describe Vote do
  it { should belong_to :user }
  it { should belong_to :link }
end
