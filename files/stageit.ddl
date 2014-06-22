metadata :name        => 'stageit',
         :description => 'Runs puppet apply on a Base64 encoded manifest on Linux agents',
         :author      => 'jeremy@puppetlabs.com',
         :license     => 'Apache v2 - No warranty',
         :version     => '1.0',
         :url         => 'http://www.puppetlabs.com',
         :timeout     => 45 
 
action "run", :description => 'Runs puppet apply on a Base64 encoded manifest on Linux agents' do
  display :always
 
   input :manifest,
         :prompt      => "manifest",
         :description => "base64 of a puppet manifest",
         :type        => :string,
         :validation  => :shellsafe,
         :optional    => false,
         :maxlength   => 900
 
  output :status,
         :description => "The exit code of the script",
         :display_as  => "Return Value"
 
  output :out,
         :description => "The output of the script on stdout",
         :display_as  => "Output Channel"
 
  output :err,
         :description => "The output of the script on stderr",
         :display_as  => "Error Channel"
 
end
