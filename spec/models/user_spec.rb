describe User do
  it { should have_many :links }
  it { should validate_presence_of :email }
  it { should validate_uniqueness_of :email}
  it { should have_secure_password }
end
