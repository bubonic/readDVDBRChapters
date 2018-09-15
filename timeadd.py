#!/usr/bin/python

import sys

def x60(h,m):
    return 60*float(h)+float(m)

def seconds(time):
    try:
       h,m,s = time.split(':')
       return x60(x60(h,m),s)
    except ValueError:
       try:
          m,s = time.split(':')
          ms = time.split('.')[-1]
          return x60(m,s,ms)
       except ValueError:
          return float(time)

def difftime(start, end):
    d = seconds(end) + seconds(start)
    print '%02d:%02d:%02d.%03d' % (d/3600,d/60%60,float(('%02f' % (d%60)).rstrip('0').rstrip('.')),  d%1 * 1000)

if __name__ == "__main__":
   difftime(sys.argv[1],sys.argv[2])
