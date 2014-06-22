stageit
===

Allow you to send a base64 encoded Puppet manifest via Mcollective/Live Management to be applied on a remote server via puppet apply with the --detailed-exitcodes option.

This means that you'll be able to see if:
 - no changes were needed => 0
 - changes were applied successfully => 2
 - it was a failure => 4
 - there was a mix of successful changes and failure => 6

<http://docs.puppetlabs.com/references/latest/man/apply.html>

```  
mco rpc stageit run manifest="ZmlsZSB7ICdDOi9mb29iYXInOgogIGVuc3VyZSA9PiBkaXJlY3RvcnksCn0KCmZpbGUgeyAnQzovZm9vYmFyL2hlbGxvJzoKICBlbnN1cmUgID0+IGZpbGUsCiAgY29udGVudCA9PiAiSGVsbG8sIFdvcmxkIVxuIiwKfQo=" -I server2008r2a
```
