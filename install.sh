#!/bin/bash

apt-get autoremove
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get install -y libcurl4-openssl-dev
sudo apt-get install -y libssl-dev
sudo apt-get install -y jq
sudo apt-get install -y ruby-full
sudo apt-get install -y libcurl4-openssl-dev libxml2 libxml2-dev libxslt1-dev ruby-dev build-essential libgmp-dev zlib1g-dev
sudo apt-get install -y build-essential libssl-dev libffi-dev python-dev
sudo apt-get install -y python-setuptools
sudo apt-get install -y libldns-dev
sudo apt-get install -y python3-pip
sudo apt-get install -y python-pip
sudo apt-get install -y python-dnspython
sudo apt-get install -y git
sudo apt-get install -y rename
sudo apt-get install -y xargs

#create a directory for tools
mkdir /root/tools
echo "done"

#install go
if [[ -z "$GOPATH" ]];then
echo "It looks like go is not installed, would you like to install it now"
PS3="Please select an option : "
choices=("y" "n")
select choice in "${choices[@]}"; do
        case $choice in
                y)

					echo "Installing Golang"
					wget https://dl.google.com/go/go1.17.6.linux-amd64.tar.gz
					sudo tar -xvf go1.17.6.linux-amd64.tar.gz
					sudo mv go /usr/local
					export GOROOT=/usr/local/go
					export GOPATH=$HOME/go
					export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
					echo 'export GOROOT=/usr/local/go' >> ~/.bash_profile
					echo 'export GOPATH=$HOME/go'	>> ~/.bash_profile			
					echo 'export PATH=$GOPATH/bin:$GOROOT/bin:$PATH' >> ~/.bash_profile	
					source ~/.bash_profile
					sleep 1
					break
					;;
				no)
					echo "Please install go and rerun this script"
					echo "Aborting installation..."
					exit 1
					;;
	esac	
done
fi


#create content-discovery, subdomain, and other directories
echo "Creating /root/tools/subdomain-enum"
mkdir /root/tools/subdomain-enum
echo "Creating /root/tools/content-discovery"
mkdir /root/tools/content-discovery
echo "Creating /root/tools/other"
mkdir /root/tools/other 
echo "Creating /root/tools/CloudFlare"
mkdir /root/tools/CloudFlare


#Don't forget to set up AWS credentials!
echo "Don't forget to set up AWS credentials!"
pip install awscli --upgrade --user
echo "Don't forget to set up AWS credentials!"


#install aquatone
echo "Installing Aquatone"
go get github.com/michenriksen/aquatone
echo "done"
 

#install kxss
echo "installing kxss"
go get github.com/Emoe/kxss
echo "done"


#install httprobe
echo "installing httprobe"
go get -u github.com/tomnomnom/httprobe 
echo "done"


#install unfurl
echo "installing unfurl"
go get -u github.com/tomnomnom/unfurl 
echo "done"


#install subfinder
echo "installing subfinder"
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
echo "done"


#install nuclei 
echo "installing nuclei"
go install -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest
echo "done"


#install waybackurls
echo "installing waybackurls"
go get github.com/tomnomnom/waybackurls
echo "done"


#install gf
echo "installing gf"
go get github.com/tomnomnom/gf
echo "done"


#install gau
echo "installing gau"
go install github.com/lc/gau/v2/cmd/gau@latest
echo "done"


#install knockpy
echo "Installing knockpy"
git clone https://github.com/guelfoweb/knock.git /root/tools/subdomain-enum/knockpy
echo "done"

#install dnsenum
echo "Installing dnsenum"
sudo apt install libtest-www-mechanize-perl libnet-whois-ip-perl
git clone https://github.com/fwaeytens/dnsenum /root/tools/subdomain-enum/dnsenum


#install subbrute
echo "Installing subbrute"
git clone https://github.com/TheRook/subbrute.git /root/tools/subdomain-enum/subbrute
echo "done"

#install assetfinder
echo "Installing asset finder"
go get github.com/tomnomnom/assetfinder
echo "done"

#install domain-finder
echo "Installing domain-finder"
cd /root/tools/subdomain-enum
wget https://raw.githubusercontent.com/gwen001/pentest-tools/master/domain-finder.py 
echo "done"

#install rsdl
echo "Installing rsdl"
go get github.com/tismayil/rsdl
go build rsdl.go

#install subDomainizer
echo "Installing subDomainizer"
git clone https://github.com/nsonaniya2010/SubDomainizer.git /root/tools/subdomain-enum/subDomainizer
echo "done"

#install domain_analyzer
echo "Installing domain_analyzer"
git clone https://github.com/eldraco/domain_analyzer.git /root/tools/subdomain-enum/domain_analyzer
echo "done"

#install massdns
echo "Installing massdns"
git clone https://github.com/blechschmidt/massdns.git /root/tools/subdomain-enum/massdns
echo "done"

#install subfinder
echo "Installing subfinder"
git clone https://github.com/subfinder/subfinder.git /root/tools/subdomain-enum/subfinder
cd /root/tools/subdomain-enum/subfinder
go get github.com/subfinder/subfinder
echo "done"

#install amass
echo "Installing amass"
go get github.com/caffix/amass
echo "done"

#install sub.sh
echo "Installing sub.sh"
sudo apt-get install jq
git clone https://github.com/cihanmehmet/sub.sh.git /root/tools/subdomain-enum/sub.sh
echo "done"

#install sublist3r
echo "Installing Sublist3r"
git clone https://github.com/aboul3la/Sublist3r.git /root/tools/subdomain-enum/Sublist3r
cd /root/tools/subdomain-enum/Sublist3r
pip install -r requirements.txt
echo "done"

#install Sudomy
echo "Installing Sudomy"
git clone --recursive https://github.com/screetsec/Sudomy.git /root/tools/subdomain-enum/Sudomy
cd /root/tools/subdomain-enum/Sudomy
pip install -r requirements.txt
echo "done"


#install s3brute
echo "installing s3brute"
git clone https://github.com/ghostlulzhacks/s3brute.git /root/tools/content-discovery/AWS/s3brute
echo "done"

#install s3-buckets-finder
echo "installing s3-buckets-finder"
git clone https://github.com/gwen001/s3-buckets-finder.git /root/tools/content-discovery/AWS/s3-buckets-finder
echo "done"

#install bucket-stream
echo "installing bucket-stream"
git clone https://github.com/eth0izzle/bucket-stream.git /root/tools/content-discovery/AWS/bucket-stream
cd /root/tools/content-discovery/AWS/bucket-stream
pip3 install -r requirements.txt
echo "done"

#install slurp
echo "installing slurp"
go get github.com/nuncan/slurp
echo "done"

#install lazys3
echo "installing lazys3"
git clone https://github.com/nahamsec/lazys3.git /root/tools/content-discovery/AWS/lazys3
echo "done"

#install cred_scanner
echo "installing cred_scanner"
git clone https://github.com/disruptops/cred_scanner.git /root/tools/content-discovery/AWS/cred_scanner
cd /root/tools/content-discovery/AWS/cred_scanner
pip install -r requirements.txt
echo "done"

#install DumpsterDiver
echo "installing DumpsterDiver"
git clone https://github.com/securing/DumpsterDiver.git /root/tools/content-discovery/AWS/DumpsterDiver
cd /root/tools/content-discovery/AWS/DumpsterDiver
pip install -r requirements.txt
echo "done"

#install S3Scanner
echo "installing S3Scanner"
git clone https://github.com/sa7mon/S3Scanner.git /root/tools/content-discovery/AWS/S3Scanner 
cd /root/tools/content-discovery/AWS/S3Scanner
pip install -r requirements.txt
echo "done"



#install JSParser
echo "installing JSParser"
git clone https://github.com/nahamsec/JSParser.git /root/tools/content-discovery/JS/JSParser
cd JSParser*
sudo python setup.py install
echo "done"

#intall relative-url-extractor
echo "installing relative-url-extractor"
git clone https://github.com/jobertabma/relative-url-extractor.git /root/tools/content-discovery/JS/relative-url-extractor
echo "done"

#install github-search
echo "installing github-search"
cd /root/tools/content-discovery/JS
wget https://raw.githubusercontent.com/gwen001/github-search/master/github-subdomains.py
echo "done"

#install subjs
echo "installing subjs"
go get github.com/lc/subjs
echo "done"

#install LinkFinder
echo "install LinkFinder"
git clone https://github.com/GerbenJavado/LinkFinder.git /root/tools/content-discovery/JS/LinkFinder
cd /root/tools/content-discovery/JS/LinkFinder
python3 -m pip install -r requirements.txt
echo "done"


#install Cobra
echo "installing Cobra"
git clone https://github.com/WhaleShark-Team/cobra.git /root/tools/content-discovery/code_audit/Cobra
cd /root/tools/content-discovery/code_audit/Cobra
pip install -r requirements.txt
echo "done"



#install crawler
echo "installing crawler"
git clone https://github.com/ghostlulzhacks/crawler.git /root/tools/content-discovery/crawlers/crawler
echo "done"

#install waybackMachine
echo "installing waybackMachine"
git clone https://github.com/ghostlulzhacks/waybackMachine.git /root/tools/content-discovery/crawlers/waybackMachine
echo "done"

#install meg
echo "installing meg"
go get github.com/tomnomnom/meg
echo "done"

#install hakrawler
echo "installing hakrawler"
go get github.com/hakluke/hakrawler
echo "done"


#install gobuster
echo "installing gobuster"
go get github.com/OJ/gobuster
echo "done"

#install ffuf
echo "installing ffuf"
go get github.com/ffuf/ffuf
echo "done"

#install dirsearch
echo "installing dirsearch"
git clone https://github.com/maurosoria/dirsearch.git /root/tools/dir-fuzz/dirsearch
echo "done"



#install imperva
echo "installing imperva"
git clone https://github.com/imperva/automatic-api-attack-tool.git /root/tools/exploitation/api/imperva
echo "done"





#install subjack
echo "installing subjack"
go get github.com/haccer/subjack
echo "done"


#install subdomain-takeover
echo "installing subdomain-takeover"
git clone https://github.com/antichown/subdomain-takeover.git /root/tools/exploitation/subdomain-takeover
cd /root/tools/exploitation/subdomain-takeover
pip install -r requirements.txt
echo "done"

#install takeover
echo "installing takeover"
git clone https://github.com/m4ll0k/takeover.git /root/tools/exploitation/takeover
echo "done"

#install SubOver
echo "installing SubOver"
go get github.com/Ice3man543/SubOver
echo "done"


#install GCPBucketBrute
echo "installing GCPBucketBrute"
git clone https://github.com/RhinoSecurityLabs/GCPBucketBrute.git /root/tools/exploitation/google-cloud-storage/GCPBucketBrute
cd /root/tools/exploitation/google-cloud-storage/GCPBucketBrute
python3 -m pip install -r requirements.txt
echo "done"




#install spaces-finder
echo "installing spaces-finder"
git clone https://github.com/appsecco/spaces-finder.git /root/tools/exploitation/digital-ocean/spaces-finder
cd /root/tools/exploitation/digital-ocean/spaces-finder
python3 -m pip install -r requirements.txt
echo "done"




#install XEEinjector
echo "installing XEEinjector"
git clone https://github.com/enjoiz/XXEinjector.git /root/tools/exploitation/XXE/XXEinjector
echo "done"



#install XSRFProbe
echo "installing XSRFProbe"
git clone https://github.com/0xInfection/XSRFProbe.git /root/tools/exploitation/CSRF/XSRFProbe
cd /root/tools/exploitation/CSRF/XSRFProbe
python3 setup.py install
echo "done"




#install commix
echo "installing commix"
git clone https://github.com/commixproject/commix.git /root/tools/exploitation/command-injection/commix
echo "done"




#install sqlmap
echo "installing sqlmap"
git clone https://github.com/sqlmapproject/sqlmap.git /root/tools/exploitation/sqli/sqlmap
echo "done"


#install sqliv
echo "installing sqliv"
git clone https://github.com/the-robot/sqliv.git /root/tools/exploitation/sqli/sqliv
cd /root/tools/exploitation/sqli/sqliv
sudo python2 setup.py -i
echo "done"

#install sqlmate
echo "installing sqlmate"
git clone https://github.com/s0md3v/sqlmate.git /root/tools/exploitation/sqli/sqlmate
cd /root/tools/exploitation/sqli/sqlmate
pip install -r requirements.txt
echo "done"



#install XSStrike
echo "installing XSStrike"
git clone https://github.com/s0md3v/XSStrike.git /root/tools/exploitation/xss/XSStrike
cd /root/tools/exploitation/xss/XSStrike
python3 -m pip install -r requirements.txt
echo "done"

#install XSS-keylogger
echo "installing XSS-keylogger"
git clone https://github.com/hadynz/xss-keylogger.git /root/tools/exploitation/xss/XSS-keylogger
echo "done"


#install CloudFail
echo "installing CloudFail"
git clone https://github.com/m0rtem/CloudFail.git /root/tools/CloudFlare/CloudFail
cd /root/tools/CloudFlare/CloudFail
pip3 install -r requirements.txt
python3 cloudfail.py
echo "done"



#installing truffleHog
echo "installing truffleHog"
python3 -m pip install trufflehog

#installing 
echo "installing git-dumper"
git clone https://github.com/arthaud/git-dumper.git /root/tools/Git/git-dumper
cd /root/tools/Git/git-dumper
pip install -r requirements.txt
pip install git-dumper
echo "done"


#install CMSmap
echo "installing CMSmap"
git clone https://github.com/Dionach/CMSmap.git /root/tools/CMS/CMSmap
cd /root/tools/CMS/CMSmap
pip3 install .
echo "done"

#install CMSeek
echo "installing CMSeek"
git clone https://github.com/Tuhinshubhra/CMSeeK.git /root/tools/CMS/CMSeek
cd /root/tools/CMS/CMSeek
python3 -m pip install -r requirements.txt
echo "done"

#install Joomscan
echo "installing Joomscan"
git clone https://github.com/rezasp/joomscan.git /root/tools/CMS/Joomscan
echo "done"

#install wpscan
echo "installing wpscan"
gem install wpscan
echo "done"

#install droopescan
echo "installing droopescan"
apt-get install python-pip
pip install droopescan
echo "done"


#install Sn1per
echo "installing Sn1per"
git clone https://github.com/1N3/Sn1per.git /root/tools/Frameworks/Sn1per
cd /root/tools/Frameworks/Sn1per
./install.sh
echo "done"


#install XRay
echo "installing XRay"
go get github.com/evilsocket/xray
cd $GOPATH/src/github.com/evilsocket/xray/
make
echo "done"



#install datasploit
echo "installing datasploit"
git clone https://github.com/DataSploit/datasploit.git /root/tools/Frameworks/datasploit
cd /root/tools/Frameworks/datasploit
python3 -m pip install --upgrade --force-reinstall -r requirements.txt
echo "done"



#install Osmedeus
echo "installing Osmedeus"
git clone https://github.com/j3ssie/Osmedeus.git /root/tools/Frameworks/osmedeus
cd /root/tools/Frameworks/osmedeus
bash install.sh
echo "done"



#install TIDoS-Framework
echo "installing TIDoS-Framework"
git clone https://github.com/0xinfection/tidos-framework.git /root/tools/Frameworks/TIDoS-Framework
cd /root/tools/Frameworks/osmedeus
chmod +x install
bash install
echo "done"



#install discover
echo "installing discover"
git clone https://github.com/leebaird/discover.git /root/tools/Frameworks/discover
cd /root/tools/Frameworks/discover
bash update.sh
echo "done"



#install lazyrecon
echo "installing lazyrecon"
git clone https://github.com/nahamsec/lazyrecon.git /root/tools/Frameworks/lazyrecon
cd /root/tools/Frameworks/lazyrecon
bash lazyrecon.sh
echo "done"



#install 003Recon
echo "installing 003Recon"
git clone https://github.com/003random/003Recon.git /root/tools/Frameworks/003Recon
cd /root/tools/Frameworks/003Recon
bash install.sh
echo "done"


#install LazyRecon
echo "installing LazyRecon"
echo "remember to set API keys!!"
git clone https://github.com/capt-meelo/LazyRecon.git /root/tools/Frameworks/LazyRecon
echo "done"


#install Vulmap
echo "installing Vulmap"
git clone https://github.com/zhzyker/vulmap.git /root/tools/Frameworks/Vulmap
cd /root/tools/Frameworks/Vulmap
python3 -m pip install -r requirements.txt
echo "done"




#install altdns
echo "installing altdns"
pip install py-altdns
echo "done"

#install nmap
echo "installing nmap"
sudo apt-get install -y nmap
echo "done"

#install Blazy
echo "installing Blazy"
git clone https://github.com/s0md3v/Blazy.git /root/tools/other/Blazy
cd /root/tools/other/Blazy
pip install -r requirements.txt
echo "done"

 

#install httprobe
echo "installing httprobe"
go get -u github.com/tomnomnom/httprobe
echo "done"

#install broken-link-checker
echo "installing broken-link-checker"
npm install broken-link-checker -g
echo "done"

#install wafw00f -it is great tool to identify web application firewall      
echo "installing wa00f"
git clone https://github.com/EnableSecurity/wafw00f.git
python3 wafw00f/setup.py install
echo "done"



#install Seclists
echo "downloading Seclist"
git clone https://github.com/danielmiessler/SecLists.git /root/tools/Wordlists/SecLists
echo "done"
cd /root/tools/Wordlists/SecLists/Discovery/DNS/
##THIS FILE BREAKS MASSDNS AND NEEDS TO BE CLEANED
cat dns-Jhaddix.txt | head -n -14 > clean-jhaddix-dns.txt


#install JHaddix Wordlist
echo "downloading JHaddix wordlist"
cd /root/tools/Wordlists
wget https://gist.githubusercontent.com/jhaddix/b80ea67d85c13206125806f0828f4d10/raw/c81a34fe84731430741e0463eb6076129c20c4c0/content_discovery_all.txt
echo "done"

#install Nahamsec list
echo "downloading Nahamsec list"
cd /root/tools/Wordlists
wget https://gist.githubusercontent.com/Leoid/38984017886cd058a314dfda5c3d6c6e/raw/1ee5fe1da82a3ae92b0c486f86fbe26bbdff1e06/Nahamsec%2520Thread
echo "done"
