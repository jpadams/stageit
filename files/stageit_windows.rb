module MCollective
  module Agent
    class Stageit<RPC::Agent
      activate_when do
        Facts["kernel"] == "windows"
      end

      action "run" do
        require "tempfile"
        require "base64"

        file = Tempfile.new('stageit')
        path = file.path
        manifest = Base64.decode64(request[:manifest])
        file.write(manifest)
        file.close
        case Facts["hardwaremodel"]
        when "x64"
          puppet = 'C:/Progra~2/Puppet~1/Puppet~1/bin/puppet.bat'
        else # 32bit
          puppet = 'C:/Progra~1/Puppet~1/Puppet~1/bin/puppet.bat'
        end
        command = "cmd /c \"#{puppet} apply #{path} --detailed-exitcodes\""
        reply[:status] = run(command,:stdout => :out, :stderr => :err, :chomp => true)
        file.unlink
        reply
      end
    end
  end
end
