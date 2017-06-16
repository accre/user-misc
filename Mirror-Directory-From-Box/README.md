# Mirror Directory from Vanderbilt Box to ACCRE Cluster

This bash script uses lftp to mirror a user-specified directory from [Vanderbilt
Box](https://vanderbilt.account.box.com/login) to the ACCRE cluster.

## Usage

To use the script, simply type:

```
bash mirrordir-from-box.sh vandyemail remotedir localdir
```

where **vandyemail** is your full vanderbilt.edu email address, **remotedir** is the directory on Box you
would like to mirror to the cluster (you can also provide subdirectories, e.g. ParentDir/SubDir1/SubDir2),
and **localdir** is the directory you would like to mirror to on the ACCRE cluster. 

Note that if **localdir** does not exist then it will be created for you. 

If **localdir** already exists, lftp will only modify those files that differ from the remote copy.

## Troubleshooting

lftp will generally give you a helpful error message if something has gone wrong. The most common issue
is authentication. If you get a CAPTCHA error, simply log into the Vanderbilt Box web interface and then try to run this script again.
If your password is not being accepted, please note that Vanderbilt Box uses Single Sign On (SSO), which lftp does not support,
so if you have not done so already, you must log into Box and click "Create External Password" from "Account Settings" and set up a 
new password. You will still use your EPassword when using the Vanderbilt Box web interface, but you will use this new external password for file
transfers to and from the ACCRE cluster.

## Enhancements

Feel free to modify this script if you need more advanced mirroring functionality. The following link provides useful examples of using the 
lftp mirror command: https://www.cyberciti.biz/faq/lftp-mirror-example/

For example, you may want to mirror a directory to Box from the ACCRE cluster, rather than vice versa (see the --reverse option).

If you do make enchancements that add new functionality that you think other Vanderbilt researchers might benefit from, we would appreciate
you submitting a pull requeset containing these enhancements! 