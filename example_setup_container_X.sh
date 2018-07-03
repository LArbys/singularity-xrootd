# setup ROOT
source /usr/local/root/release/bin/thisroot.sh

# get the permissions/certificates: replace XXXXXX with your username
# the user id (YYYYYY) is also specific for each user, so change that
kinit XXXXXX@FNAL.GOV
scp XXXXXXX@uboonebuild01.fnal.gov:/tmp/x509up_uYYYYY /tmp
export X509_USER_PROXY=/tmp/x509up_uYYYYYY
# for folks with production credentials, replace Analysis with Production
voms-proxy-init -noregen -voms fermilab:/fermilab/uboone/Role=Analysis
