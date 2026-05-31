RSpec.configure do |config|
  config.before(:suite) do
    storage_root = Rails.root.join('tmp/storage_test')
    FileUtils.rm_rf(storage_root)
    FileUtils.mkdir_p(storage_root)
  end
end
