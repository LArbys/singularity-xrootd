# Singularity for ROOT with XROOTD

Container to be used for file xfer from FNAL.
In order to xfer files, the container must have its certificates to FNAL updated periodically.

To do this:

* make sure your computer is setup to be able to get a FNAL kerberos ticket (i.e. `kinit` workse)
* clone this repo to your computer
* get a kerberos ticket: `kinit [username]@FNAL.GO
* make sure `/tmp/grid-certificates` and `/tmp/vomses` are removed from your `/tmp` folder
* scp `/etc/grid-certificates` and `/etc/vomses` to your `/tmp` folder from one of the uboone gpvms.
* cp `/etc/krb5.conf` to `/tmp`
* finally, build the container using: `sudo singularity build singularity-xrood.img Singularity`


Basically what is happening is that, while being built, the container can see your system's `/tmp` folder.
So we put the required security files into `/tmp` and these get copied into the container's `/etc/` folder when it is built.