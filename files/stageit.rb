module MCollective
  module Agent
    class Stageit<RPC::Agent
      activate_when do
        Facts["kernel"] != "windows"
      end

      action "run" do
        require 'tempfile'

        file = Tempfile.new('stageit')
        path = file.path
        file.close

        command = "/opt/puppet/bin/puppet apply #{path} --detailed-exitcodes"

        create_manifest = "echo " + request[:manifest] + " | base64 -d > " + path
        `#{create_manifest}`

        reply[:status] = run(command,:stdout => :out, :stderr => :err, :chomp => true)
        file.unlink
        reply
      end
    end
  end
end
