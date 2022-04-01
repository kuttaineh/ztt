# ztt
a cross-platform typing tutor which speaks and gives positive feedback

## Installation Note

> Having git is not necessary; one can download this respository as an archive ztt.zip, extract it and run Zeke's Typing Tutor directly. These instructions are written for someone interested in not only ztt but also in software development. Under macOS you can install git simply by typing git[return] as demonstrated in [this video](https://youtu.be/PSULlxUk744).

## Installing to GNU/Linux and macOS

#### From a newly opened GNU/Linux or macOS Terminal type:
```
git clone https://github.com/kuttaineh/ztt.git
cd ztt
```

#### GNU/Linux ONLY:
```
ln -s $HOME/ztt/ztt.bash ztt
```
#### macOS ONLY:
```
echo "bash $HOME/ztt/ztt.bash">ztt
```
#### Both GNU/Linux & macOS:
```
chmod +x ztt
sudo mkdir -p /usr/local/bin
sudo mv ztt /usr/local/bin
```
## Windows Installation

If you don't yet have it, first install Git for Windows https://gitforwindows.org
Then, after launching Git Bash:
```
mkdir $HOME/bin
git clone https://github.com/kuttaineh/ztt.git
cd ztt
echo "bash $HOME/ztt/ztt.bash">ztt
chmod +x ztt
mv ztt ../bin
```

![Git for Windows](gitforwindows.png)

## Launch

Same in GNU/Linux, macOS, or Git for Windows Git Bash Terminal. Simply type:
```
ztt
```
Realtime user instructions are provided by the program. 

## Quit program
```
q
```
