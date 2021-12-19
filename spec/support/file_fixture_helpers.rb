def file_fixture(file_name)
  File.read("./spec/fixtures/#{file_name}")
end
