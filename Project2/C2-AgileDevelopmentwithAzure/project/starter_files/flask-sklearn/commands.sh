git clone https://github.com/chandrepo/DevOps-Engineer-for-Azure.git
cd DevOps-Engineer-for-Azure/Project2/C2-AgileDevelopmentwithAzure/project/starter_files/flask-sklearn
git pull
make setup
. ~/.udacity-devops/bin/activate
make all
az group create --location centralus --name flaskwebapp-rg
az appservice plan create -g flaskwebapp-rg -n chandyadlapalli_asp_Linux_centralus_0
az webapp up --name flask-ml-service-cd  --plan chandyadlapalli_asp_Linux_centralus_0 --location centralus --runtime "PYTHON|3.7"
deactivate
rm -rf ~/.udacity-devops
