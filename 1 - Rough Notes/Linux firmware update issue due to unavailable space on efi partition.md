Tags: [[Linux]], [[Linux Commands]] 

I have been unable to update my linux firmware because of lack of space on /boot/efi partition.

The following steps I used to try to solve the issue.

1. I first tried to check size of partitions and the space remaining on those partitions.
	```sh
❯ df -h
```
	The partition's size is 96 MB which should be good enough for most cases however I was not able to install the firmware update. 34M is used and 63M is free. I need about 76M.

2. I then inspected the content of `/boot/efi` partition using `ls /boot/efi`. I gave the content to Claude. According to it, most spaces is occupied by language files.
3. I used the following command to print the content within Microsoft boot files within my `/boot/efi` partition.
```sh
❯ sudo du -sh /boot/efi/EFI/Microsoft/Boot/* | sort -h
```
4. This directory has lots of language files. Ideally, I would only want language files in english. There is also a fonts directory of 14 Megabytes which I might not need.