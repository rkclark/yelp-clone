describe User do
  context 'associations' do
    it { is_expected.to have_many(:restaurants).dependent(:destroy) }
  end
end
