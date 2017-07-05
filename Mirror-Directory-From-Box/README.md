# Mirror Directory from Vanderbilt Box to ACCRE Cluster

This bash script uses [lftp](https://lftp.yar.ru/) to mirror a user-specified directory from [Vanderbilt
Box](https://vanderbilt.account.box.com/login) to the ACCRE cluster.

It is a requirement that you set up a BOX "external password" in order for lftp to operate with BOX over FTPS. See the troubleshooting section for details.

## Usage

To use the script, simply type:

```sh
bash mirrordir-from-box.sh vandyemail remotedir localdir
```

where ```vandyemail``` is your full vanderbilt.edu email address, ```remotedir``` is the directory on Box you
would like to mirror to the cluster (you can also provide subdirectories, e.g. ParentDir/SubDir1/SubDir2),
and ```localdir``` is the directory you would like to mirror to on the ACCRE cluster. 

Note that if ```localdir``` does not exist then it will be created for you. 

If  ```localdir``` already exists, lftp will only modify those files that differ from the remote copy.

## Troubleshooting

lftp will generally give you a helpful error message if something has gone wrong. The most common issue
is authentication. If you get a CAPTCHA error, simply log into the Vanderbilt Box web interface with your Single Sign On (SSO) credentials and then re-run the script.

If your password is not being accepted by lftp, please note that Vanderbilt Box uses Single Sign On (SSO), which lftp does not support, so if you have not done so already, you must log into Box and click "Create External Password" from "Account Settings" and set up an external password (which is different from your Vanderbilt EPassword). You will still use your EPassword when using the Vanderbilt Box web interface, but you will use this new external password for lftp file transfers to and from the ACCRE cluster.

## Enhancements

Feel free to modify this script if you need more advanced mirroring functionality. The following link provides useful examples of using the lftp mirror command: https://www.cyberciti.biz/faq/lftp-mirror-example/

For example, you may want to mirror a directory to Box from the ACCRE cluster, rather than vice versa (see the --reverse option).

If you do make enhancements that add new functionality that you think other Vanderbilt researchers might benefit from, we would appreciate you submitting a pull request containing these enhancements! 