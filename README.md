# Singularity for ROOT with XROOTD

Container to be used for file xfer from FNAL.
In order to xfer files, the container must have its certificates to FNAL updated periodically.

# Steps to using this container and image (from scratch)

Part 1: build the container
* build the container

Part 2: move the container to Tufts
* go to the Tufts cluster (and probably to some place your user directory)
* clone this repository
* copy the container to the repository folder as there are scripts we will use

Part 3: renew your user grid certificate on a MicroBooNE machine
* log into the microboone machine
* on the UBmachine: load/renew your certificates, find your UID
* back on tufts cluster: make a copy of example_setup_container_X.sh and edit it as instructed
* start the container, go to the repo dir, run the script

Part 4: make a list of files to transfer. either:
* make a filelist
* retrieve or setup a SAM definition

Part 5: setup xfer_script and run


## Building the container

First find a computer that has docker and singularity (e.g. meitner). You will also need `sudo` access to build the container.

Clone this repo onto a computer:

    git clone https://github.com/larbys/singularity-xrootd
    
Next, follow the steps below to grab the required certificates from uboonebuild and copy them to your local machine

* make sure your computer is setup to be able to get a FNAL kerberos ticket (i.e. `kinit` workse)
* clone this repo to your computer
* get a kerberos ticket: `kinit [username]@FNAL.GOV`
* make the directory `/tmp/$USER` to hold certificates (must be somewhere in `/tmp` in order for singularity to read from outside the new container)
* if running this not for the first time, make sure `/tmp/$USER/grid-security` and `/tmp/$USER/vomses` are removed from your `/tmp/$USER/` folder
* scp -r `/etc/grid-security` and `/etc/vomses` to your `/tmp/$USER` folder from one of the uboone gpvms.

      scp -r fnal-username@ubcomputer:/etc/grid-security /tmp/$USER/
      scp fnal-username@ubcomputer:/etc/vomses /tmp/$USER/

* cp `/etc/krb5.conf` to `/tmp/$USER/` or get this from the web using

      wget https://cdcvs.fnal.gov/redmine/attachments/download/9616/krb5.conf /tmp/$USER/

* go into `Singularity` file (this is the build instructions), and set your username at the line

      export USER=your-name-here


Finally, build the container using: 


    sudo singularity build singularity-xrootd.img Singularity


Basically what is happening is that, while being built, the container can see your system's `/tmp` folder.
So we put the required security files into `/tmp` and these get copied into the container's `/etc/` folder when it is built.

## Using container

* copy the new container to the Tuft's grid at: `/cluster/tufts/wongjiradlab/larbys/images/singularity-xrootd`
* start the container using `source start_container.sh`
* you'll see a prompt once you are in the container.  type `bash` to start a bash shell
* navigate back to the container folder: `cd /cluster/kappa/wongjiradlab/larbys/images/singularity-xrootd`
* in another terminal, log into one of the uboone gpvms. refresh your vomses certificates.
* make a copy of `example_setup_container_X.sh`, where `X` is your FNAL username
* change XXXXXX with your FNAL username and YYYYYY with your user id
* run this script
* you can test that your container now has permissions to use xrootd to access PNFS by running: `python test_setup.py`
