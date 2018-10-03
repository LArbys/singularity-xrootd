# Singularity for ROOT with XROOTD

Container to be used for file xfer from FNAL.
In order to xfer files, the container must have its certificates to FNAL updated periodically.

## Building the container

First find a computer that has docker and singularity (e.g. meitner). You will also need `sudo` access to build the container.

Clone this repo onto a computer:

    git clone https://github.com/larbys/singularity-xrootd
    
Next, follow the steps below to grab the required certificates from uboonebuild and copy them to your local machine

* make sure your computer is setup to be able to get a FNAL kerberos ticket (i.e. `kinit` workse)
* clone this repo to your computer
* get a kerberos ticket: `kinit [username]@FNAL.GOV`
* make sure `/tmp/grid-security` and `/tmp/vomses` are removed from your `/tmp` folder
* scp `/etc/grid-certificates` and `/etc/vomses` to your `/tmp` folder from one of the uboone gpvms.
* cp `/etc/krb5.conf` to `/tmp`


Finally, build the container using: 


    sudo singularity build singularity-xrood.img Singularity


Basically what is happening is that, while being built, the container can see your system's `/tmp` folder.
So we put the required security files into `/tmp` and these get copied into the container's `/etc/` folder when it is built.

## Using container

* copy the new container to the Tuft's grid at: `/cluster/tufts/wongjiradlab/larbys/images/singularity-xrootd`
* start the container using `source start_container.sh`
* you'll see a prompt once you are in the container.  type `bash` to start a bash shell
* navigate back to the container folder: `cd /cluster/kappa/wongjiradlab/larbys/imagees/singularity-xrootd`
* in another terminal, log into one of the uboone gpvms. refresh your vomses certificates.
* make a copy of `example_setup_container_X.sh`, where `X` is your FNAL username
* change XXXXXX with your FNAL username and YYYYYY with your user id
* run this script
* you can test that your container now has permissions to use xrootd to access PNFS by running: `python test_setup.py`
