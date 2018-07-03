import os,sys


def dump_dir_list( pathlist ):

    f = open(pathlist,'r')
    lines = f.readlines()
    f.close()

    print "Number of events in list: " ,len(lines)

    for l in lines:
        l = l.strip()
        pieces = l.split("/")
        dirname = os.path.dirname( l )
        pnfsname = dirname.strip().replace("/pnfs/","/pnfs/fnal.gov/usr/").strip()
        cmd = "xrdfs xroot://fndca1.fnal.gov ls -l %s"%(pnfsname)
        print cmd
        x = os.popen(cmd)
        for i in x.readlines():
            print i.strip()
        break


if __name__=="__main__":

    dump_dir_list( "test-list.txt" )
        
