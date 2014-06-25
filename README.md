galaxy_rnastar
==============

galaxy wrapper for rna-star aligner
Uses the rna star option 
--genomeLoad LoadAndRemove
This makes it easy for (eg) SGE to
schedule lots of simultaneous jobs with (eg) as many 4 thread slots
as will safely fit on your nodes with only one copy of the 25GB genome index ever in ram
on each node. It's wicked fast too.

This bliss requires shared memory tweaks documented
in the manual for reliable operation on 
most linux boxen because the index files are ginormous
if you build them with a gene model - 25GB for rn5 eg.

This also involved fixing the shared memory limits on all the cluster boxen, as described in the docs:

Many standard Linux distributions do not allow large enough shared memory blocks. You can fix this issue
if you have root privileges, or ask you system administrator to do it. To enable the shared memory modify or
add the following lines to /etc/sysctl.conf:
kernel.shmmax = 31000000000
kernel.shmall = 31000000000
Then run:
> /sbin/sysctl -p
This will increase the allowed shared memory blocks to ~31GB, enough for human or mouse genome.

The above worked for me.

This should self install on any recent Galaxy deployment.
You'll have to build the indexes yourself until someone builds a data manager.
Send code.


