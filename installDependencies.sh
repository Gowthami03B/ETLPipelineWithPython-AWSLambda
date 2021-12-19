#Connecting to your AWS EC2 Linux instance using SSH
ssh -i "path for your my_key.pem" linux@ec2-54-209-246-66.compute-1.amazonaws.com


sudo apt-get update   #Update the system 
python3 -V  #Check the version of python


sudo apt-get install python3.9 -y    # Installing python version 3.7

#Updating alternatives - This points to python 3.7 insted of 3.6 when we open python (Updates the Symbolic links)
sudo update-alternatives --install /urs/bin/python3 python3 /usr/python3.6 1
sudo update-alternatives --install /urs/bin/python3 python3 /usr/python3.7 2

#create a directory to install all the packages we need 
mkdir -p build/python/lab/python3.7/site-packages

# Install Pip , Zip and awscli ( Replace the packages with the ones you need)
sudo apt install python3-pip #hit "Y" if you get a prompt "Do you want to continue? [Y/n]"
sudo apt-get install awscli 
sudo apt-get install zip 

#install required packages
pip3 install pandas requests pygsheets -t build/python/lab/python3.7/site-packages/ --system

cd build/

#Zip the installed packages to be uploaded to S3
zip -r pandas_requests_pygsheets.zip .

#copy the Zip file to S3 , I had created a S3 bucket called covid_data already.
aws s3 cp pandas_requests_pygsheets.zip s3://firstbucket

👋
