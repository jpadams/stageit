stageit
=======

Allow you to send a base64 encoded Puppet manifest via Mcollective/Live Management to be applied on a remote server via puppet apply with the --detailed-exitcodes option.

This means that you'll be able to see if:
 - no changes were needed => 0
 - changes were applied successfully => 2
 - it was a failure => 4
 - there was a mix of successful changes and failure => 6

<http://docs.puppetlabs.com/references/latest/man/apply.html>

example
-------
```puppet
file { 'C:/foobar':
  ensure => directory,
}

file { 'C:/foobar/hello':
  ensure  => file,
  content => "Hello, World!\n",
}
```
Use the `base64` command to encode the manifest as a blob of characters to pass to the mco plugin.
If you stored the above text in a file called /tmp/foobar.pp you could run the following to get your blob:
```
$ cat /tmp/foobar.pp | base64
ZSB7ICdDOi9mb29iYXInOgogIGVuc3VyZSA9PiBkaXJlY3RvcnksCn0KCmZpbGUgeyAnQzovZm9vYmFyL2hlbGxvJzoKICBlbnN1cmUgID0+IGZpbGUsCiAgY29udGVudCA9PiAiSGVsbG8sIFdvcmxkIVxuIiwKfQo=
```
Be careful of linebreaks in the output messing you up. On my mac I pipe to `pbcopy` to put the blob of base64 right into my clipboard/paste buffer.

In my example below, I'm calling `mco` as the pe-admin user in Puppet Enterprise and apply my manifest to a Windows server called server2008r2a. Look for the return code in the status field.
```  
# su - peadmin -c 'mco rpc stageit run manifest="ZmlsZSB7ICdDOi9mb29iYXInOgogIGVuc3VyZSA9PiBkaXJlY3RvcnksCn0KCmZpbGUgeyAnQzovZm9vYmFyL2hlbGxvJzoKICBlbnN1cmUgID0+IGZpbGUsCiAgY29udGVudCA9PiAiSGVsbG8sIFdvcmxkIVxuIiwKfQo=" -I server2008r2a'	

 * [ ============================================================> ] 1 / 1


server2008r2a
    Error Channel:
   Output Channel: Notice: Compiled catalog for server2008r2a in environment production in 0.16 seconds
                   Notice: /Stage[main]/Main/File[C:/foobar]/ensure: created
                   Notice: /Stage[main]/Main/File[C:/foobar/hello]/ensure: defined content as '{md5}bea8252ff4e80f41719ea13cdf007273'
                   Notice: Finished catalog run in 0.55 seconds
     Return Value: 2



Finished processing 1 / 1 hosts in 18862.32 ms
```
