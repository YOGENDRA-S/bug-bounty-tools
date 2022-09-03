#!/bin/bash


sudo apt-get -y update

sudo apt-get -y upgrade

sudo apt-get instally libcurl4-openssl-dev

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


sudo apt-get install -y xarg

#install go
if [[ -z "$GOPATH" ]];then
echo "It looks like go is not installed, would you like to install it now"
PS3="Please select an option : "
choices=("yes" "no")
select choice in "${choices[@]}"; do
        case $choice in
                yes)

					echo "Installing Golang"
					wget https://dl.google.com/go/go1.19.linux-amd64.tar.gz
					sudo tar -xvf go1.19.linux-amd64.tar.gz
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


#Don't forget to set up AWS credentials!
echo "Don't forget to set up AWS credentials!"
apt install -y awscli
echo "Don't forget to set up AWS credentials!"



#create a tools folder in ~/
mkdir ~/tools
cd ~/tools/

#installing
echo "installing"
go install github.com/lc/gau/v2/cmd/gau@latest
go install github.com/projectdiscovery/httpx/cmd/httpx@latest
go install github.com/hahwul/dalfox/v2@latest
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
go install -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest
go install github.com/tomnomnom/unfurl@latest
go install -v github.com/projectdiscovery/naabu/v2/cmd/naabu@latest
go install -v github.com/lukasikic/subzy@latest
go install -v github.com/projectdiscovery/proxify/cmd/proxify@latest
go install github.com/OJ/gobuster/v3@latest
echo "done"

#installing qsreplace
echo "installing qsreplace"
go install github.com/tomnomnom/qsreplace@latest
echo "done"

#installing aquatone
echo "Installing aquatone"
go install github.com/michenriksen/aquatone@latest
echo "done"
 

#installing kxss
echo "installing kxss"
go install github.com/Emoe/kxss@latest
echo "done"

#installing waybackurls
echo "installing waybackurls"
go install github.com/tomnomnom/waybackurls@latest
echo "done"

#installing assetfinder
echo "installing assetfinder"
go install github.com/tomnomnom/assetfinder@latest
echo "done"


#installing httprobe
echo "installing httprobe"
go install github.com/tomnomnom/httprobe@latest
echo "done"


#installing gf
echo "installing gf"
go install github.com/tomnomnom/gf@latest
echo "done"




#installing knockpy
echo "Installing knockpy"
git clone https://github.com/guelfoweb/knock.git root/tools/knockpy
echo "done"

#installing dnsenum
echo "Installing dnsenum"
sudo apt install libtest-www-mechanize-perl libnet-whois-ip-perl
git clone https://github.com/fwaeytens/dnsenum root/tools/dnsenum
echo "done"

#installing subbrute
echo "Installing subbrute"
git clone https://github.com/TheRook/subbrute.git root/tools/subdomain-enum/subbrute
echo "done"

#installing assetfinder
echo "Installing assetfinder"
go install github.com/tomnomnom/assetfinder@latest
echo "done"

#installing domain-finder
echo "Installing domain-finder"
cd /tools/subdomain-enum
wget https://raw.githubusercontent.com/gwen001/pentest-tools/master/domain-finder.py 
echo "done"

#installing rsdl
echo "Installing rsdl"
go install github.com/tismayil/rsdl@latest
echo "done"

#installing subDomainizer
echo "Installing subDomainizer"
git clone https://github.com/nsonaniya2010/SubDomainizer.git root/tools/subdomain-enum/subDomainizer
echo "done"

#installing domain_analyzer
echo "Installing domain_analyzer"
git clone https://github.com/eldraco/domain_analyzer.git root/tools/subdomain-enum/domain_analyzer
echo "done"

#installing XSRFProbe
echo "installing XSRFProbe"
git clone https://github.com/0xInfection/XSRFProbe.git
pip install xsrfprobe
echo "done"


#installing massdns
echo "Installing massdns"
git clone https://github.com/blechschmidt/massdns.git /root/tools/subdomain-enum/massdns
echo "done"
1	
#installing subfinder
echo "Installing subfinder"
git clone https://github.com/subfinder/subfinder.git /root/tools/subdomain-enum/subfinder
cd /root/tools/subdomain-enum/subfinder
go get github.com/subfinder/subfinder
echo "done"

#installing amass
echo "Installing amass"
go install github.com/caffix/amass@latest
echo "done"

#installing sub.sh
echo "Installing sub.sh"
sudo apt-get install jq
git clone https://github.com/cihanmehmet/sub.sh.git /root/tools/subdomain-enum/sub.sh
echo "done"

#installing sublist3r
echo "Installing Sublist3r"
git clone https://github.com/aboul3la/Sublist3r.git /root/tools/subdomain-enum/Sublist3r
cd /root/tools/subdomain-enum/Sublist3r
pip install -r requirements.txt
echo "done"

#installing Sudomy
echo "Installing Sudomy"
git clone --recursive https://github.com/screetsec/Sudomy.git /root/tools/subdomain-enum/Sudomy
cd /root/tools/subdomain-enum/Sudomy
pip install -r requirements.txt
echo "done"


#installing s3brute
echo "installing s3brute"
git clone https://github.com/ghostlulzhacks/s3brute.git /root/tools/content-discovery/AWS/s3brute
echo "done"

#installing s3-buckets-finder
echo "installing s3-buckets-finder"
git clone https://github.com/gwen001/s3-buckets-finder.git /root/tools/content-discovery/AWS/s3-buckets-finder
echo "done"

#installing bucket-stream
echo "installing bucket-stream"
git clone https://github.com/eth0izzle/bucket-stream.git /root/tools/content-discovery/AWS/bucket-stream
cd /root/tools/content-discovery/AWS/bucket-stream
pip3 install -r requirements.txt
echo "done"

#installing slurp
echo "installing slurp"
go install github.com/nuncan/slurp@latest
echo "done"

#installing lazys3
echo "installing lazys3"
git clone https://github.com/nahamsec/lazys3.git /root/tools/content-discovery/AWS/lazys3
echo "done"

#installing cred_scanner
echo "installing cred_scanner"
git clone https://github.com/disruptops/cred_scanner.git /root/tools/content-discovery/AWS/cred_scanner
cd /root/tools/content-discovery/AWS/cred_scanner
pip install -r requirements.txt
echo "done"

#installing DumpsterDiver
echo "installing DumpsterDiver"
git clone https://github.com/securing/DumpsterDiver.git /root/tools/content-discovery/AWS/DumpsterDiver
cd /root/tools/content-discovery/AWS/DumpsterDiver
pip install -r requirements.txt
echo "done"

#installing S3Scanner
echo "installing S3Scanner"
git clone https://github.com/sa7mon/S3Scanner.git /root/tools/content-discovery/AWS/S3Scanner 
cd /root/tools/content-discovery/AWS/S3Scanner
pip install -r requirements.txt
echo "done"



#installing JSParser
echo "installing JSParser"
git clone https://github.com/nahamsec/JSParser.git /root/tools/content-discovery/JS/JSParser
cd JSParser*
sudo python setup.py install
echo "done"

#intalling relative-url-extractor
echo "installing relative-url-extractor"
git clone https://github.com/jobertabma/relative-url-extractor.git /root/tools/content-discovery/JS/relative-url-extractor
echo "done"

#installing github-search
echo "installing github-search"
cd /root/tools/content-discovery/JS
wget https://raw.githubusercontent.com/gwen001/github-search/master/github-subdomains.py
echo "done"

#installing subjs
echo "installing subjs"
GO111MODULE=on go get -u -v github.com/lc/subjs@latest
echo "done"

#installing LinkFinder
echo "install LinkFinder"
git clone https://github.com/GerbenJavado/LinkFinder.git /root/tools/content-discovery/JS/LinkFinder
cd /root/tools/content-discovery/JS/LinkFinder
python3 -m pip install -r requirements.txt
echo "done"


#installing Cobra
echo "installing Cobra"
git clone https://github.com/WhaleShark-Team/cobra.git /root/tools/content-discovery/code_audit/Cobra
cd /root/tools/content-discovery/code_audit/Cobra
pip install -r requirements.txt
echo "done"



#installing crawler
echo "installing crawler"
git clone https://github.com/ghostlulzhacks/crawler.git /root/tools/content-discovery/crawlers/crawler
echo "done"

#installing waybackMachine
echo "installing waybackMachine"
git clone https://github.com/ghostlulzhacks/waybackMachine.git /root/tools/content-discovery/crawlers/waybackMachine
echo "done"

#installing meg
echo "installing meg"
go install github.com/tomnomnom/meg@latest
echo "done"

#installing hakrawler
echo "installing hakrawler"
go install github.com/hakluke/hakrawler@latest
echo "done"


#installing ffuf
echo "installing ffuf"
go get -u github.com/ffuf/ffuf
echo "done"

#installing dirsearch
echo "installing dirsearch"
git clone https://github.com/maurosoria/dirsearch.git /root/tools/dir-fuzz/dirsearch
echo "done"



#installing imperva
echo "installing imperva"
git clone https://github.com/imperva/automatic-api-attack-tool.git /root/tools/exploitation/api/imperva
echo "done"





#installing subjack
echo "installing subjack"
go install github.com/haccer/subjack@latest
echo "done"


#installing subdomain-takeover
echo "installing subdomain-takeover"
git clone https://github.com/antichown/subdomain-takeover.git /root/tools/exploitation/subdomain-takeover
cd /root/tools/exploitation/subdomain-takeover
pip install -r requirements.txt
echo "done"

#installing takeover
echo "installing takeover"
git clone https://github.com/m4ll0k/takeover.git /root/tools/exploitation/takeover
echo "done"

#installing SubOver
echo "installing SubOver"
go install github.com/Ice3man543/SubOver@latest
echo "done"


#installing GCPBucketBrute
echo "installing GCPBucketBrute"
git clone https://github.com/RhinoSecurityLabs/GCPBucketBrute.git /root/tools/exploitation/google-cloud-storage/GCPBucketBrute
cd /root/tools/exploitation/google-cloud-storage/GCPBucketBrute
python3 -m pip install -r requirements.txt
echo "done"




#installing spaces-finder
echo "installing spaces-finder"
git clone https://github.com/appsecco/spaces-finder.git /root/tools/exploitation/digital-ocean/spaces-finder
cd /root/tools/exploitation/digital-ocean/spaces-finder
python3 -m pip install -r requirements.txt
echo "done"




#installing XEEinjector
echo "installing XEEinjector"
git clone https://github.com/enjoiz/XXEinjector.git /root/tools/exploitation/XXE/XXEinjector
echo "done"



#installing XSRFProbe
echo "installing XSRFProbe"
git clone https://github.com/0xInfection/XSRFProbe.git /root/tools/exploitation/CSRF/XSRFProbe
cd /root/tools/exploitation/CSRF/XSRFProbe
python3 setup.py install
echo "done"




#installing commix
echo "installing commix"
git clone https://github.com/commixproject/commix.git /root/tools/exploitation/command-injection/commix
echo "done"




#installing sqlmap
echo "installing sqlmap"
git clone https://github.com/sqlmapproject/sqlmap.git /root/tools/exploitation/sqli/sqlmap
echo "done"


#installing sqliv
echo "installing sqliv"
git clone https://github.com/the-robot/sqliv.git /root/tools/exploitation/sqli/sqliv
cd /root/tools/exploitation/sqli/sqliv
sudo python2 setup.py -i
echo "done"

#installing sqlmate
echo "installing sqlmate"
git clone https://github.com/s0md3v/sqlmate.git /root/tools/exploitation/sqli/sqlmate
cd /root/tools/exploitation/sqli/sqlmate
pip install -r requirements.txt
echo "done"



#installing XSStrike
echo "installing XSStrike"
git clone https://github.com/s0md3v/XSStrike.git /root/tools/exploitation/xss/XSStrike
cd /root/tools/exploitation/xss/XSStrike
python3 -m pip install -r requirements.txt
echo "done"

#installing XSS-keylogger
echo "installing XSS-keylogger"
git clone https://github.com/hadynz/xss-keylogger.git /root/tools/exploitation/xss/XSS-keylogger
echo "done"


#installing CloudFail
echo "installing CloudFail"
git clone https://github.com/m0rtem/CloudFail.git /root/tools/CloudFlare/CloudFail
cd /root/tools/CloudFlare/CloudFail
pip3 install -r requirements.txt
python3 cloudfail.py
echo "done"



#installing truffleHog
echo "installing truffleHog"
python3 -m pip install trufflehog

#installing git-dumper
echo "installing git-dumper"
git clone https://github.com/arthaud/git-dumper.git /root/tools/Git/git-dumper
cd /root/tools/Git/git-dumper
pip install -r requirements.txt
pip install git-dumper
echo "done"


#installing CMSmap
echo "installing CMSmap"
git clone https://github.com/Dionach/CMSmap.git /root/tools/CMS/CMSmap
cd /root/tools/CMS/CMSmap
pip3 install .
echo "done"

#installing CMSeek
echo "installing CMSeek"
git clone https://github.com/Tuhinshubhra/CMSeeK.git /root/tools/CMS/CMSeek
cd /root/tools/CMS/CMSeek
python3 -m pip install -r requirements.txt
echo "done"

#installing Joomscan
echo "installing Joomscan"
git clone https://github.com/rezasp/joomscan.git /root/tools/CMS/Joomscan
echo "done"

#installing wpscan
echo "installing wpscan"
gem install wpscan
echo "done"

#installing droopescan
echo "installing droopescan"
apt-get install python-pip
pip install droopescan
echo "done"


#installing Sn1per
echo "installing Sn1per"
git clone https://github.com/1N3/Sn1per.git /root/tools/Frameworks/Sn1per
cd /root/tools/Frameworks/Sn1per
echo "done"


#installing XRay
echo "installing XRay"
go install github.com/evilsocket/xray@latest
echo "done"



#installing datasploit
echo "installing datasploit"
git clone https://github.com/DataSploit/datasploit.git /root/tools/Frameworks/datasploit
cd /root/tools/Frameworks/datasploit
python3 -m pip install --upgrade --force-reinstall -r requirements.txt
echo "done"



#installing Osmedeus
echo "installing Osmedeus"
git clone https://github.com/j3ssie/Osmedeus.git /root/tools/Frameworks/osmedeus
cd /root/tools/Frameworks/osmedeus
echo "done"



#installing TIDoS-Framework
echo "installing TIDoS-Framework"
git clone https://github.com/0xinfection/tidos-framework.git /root/tools/Frameworks/TIDoS-Framework
cd /root/tools/Frameworks/osmedeus
chmod +x install
echo "done"



#installing discover
echo "installing discover"
git clone https://github.com/leebaird/discover.git /root/tools/Frameworks/discover
cd /root/tools/Frameworks/discover
echo "done"



#installing lazyrecon
echo "installing lazyrecon"
git clone https://github.com/nahamsec/lazyrecon.git /root/tools/Frameworks/lazyrecon
cd /root/tools/Frameworks/lazyrecon
chmod +x lazyrecon.sh
echo "done"



#installing 003Recon
echo "installing 003Recon"
git clone https://github.com/003random/003Recon.git /root/tools/Frameworks/003Recon
cd /root/tools/Frameworks/003Recon
chmod +x install.sh
echo "done"


#installing LazyRecon
echo "installing LazyRecon"
echo "remember to set API keys!!"
git clone https://github.com/capt-meelo/LazyRecon.git /root/tools/Frameworks/LazyRecon
echo "done"


#installing Vulmap
echo "installing Vulmap"
git clone https://github.com/zhzyker/vulmap.git /root/tools/Frameworks/Vulmap
cd /root/tools/Frameworks/Vulmap
python3 -m pip install -r requirements.txt
echo "done"




#installing altdns
echo "installing altdns"
pip install py-altdns
echo "done"

#installing nmap
echo "installing nmap"
sudo apt-get install -y nmap
echo "done"

#installing Blazy
echo "installing Blazy"
git clone https://github.com/s0md3v/Blazy.git /root/tools/other/Blazy
cd /root/tools/other/Blazy
pip install -r requirements.txt
echo "done"

 

#installing httprobe
echo "installing httprobe"
go install github.com/tomnomnom/httprobe@latest
echo "done"

#installing broken-link-checker
echo "installing broken-link-checker"
npm install broken-link-checker -g
echo "done"

#installing wafw00f -it is great tool to identify web application firewall      
echo "installing wa00f"
git clone https://github.com/EnableSecurity/wafw00f.git
python3 wafw00f/setup.py install
echo "done"



#installing Seclists
echo "downloading Seclist"
git clone https://github.com/danielmiessler/SecLists.git /root/tools/Wordlists/SecLists
echo "done"
cd /root/tools/Wordlists/SecLists/Discovery/DNS/
##THIS FILE BREAKS MASSDNS AND NEEDS TO BE CLEANED
cat dns-Jhaddix.txt | head -n -14 > clean-jhaddix-dns.txt


#installing JHaddix Wordlist
echo "downloading JHaddix wordlist"
cd /root/tools/Wordlists
wget https://gist.githubusercontent.com/jhaddix/b80ea67d85c13206125806f0828f4d10/raw/c81a34fe84731430741e0463eb6076129c20c4c0/content_discovery_all.txt
echo "done"

#installing Nahamsec list
echo "downloading Nahamsec list"
cd /root/tools/Wordlists
wget https://gist.githubusercontent.com/Leoid/38984017886cd058a314dfda5c3d6c6e/raw/1ee5fe1da82a3ae92b0c486f86fbe26bbdff1e06/Nahamsec%2520Thread
echo "done"

sudo apt-get -y autoremove
