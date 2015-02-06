require 'byebug'
require 'json'

module URLStripper

  class WDI

    def self.get_json
      JSON.parse(Repo.all.to_json)
    end

    def self.get_ssh_urls(json)
      json.map { |repo| data = repo["github_data"].to_h }.map { |data| data["ssh_url"] }
    end

    def self.output_to_file(array)
      output = File.open("docs/blob.txt", "w")
      array.each { |url| output.puts url + "\n" }
      output.close
    end
  end
end