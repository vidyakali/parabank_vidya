 Installation steps
git clone https://github.com/bdd-training-clt/clt-bdd-ui.git into your workspace directory (example: open git bash and type cd /c/users/your-username/workspace)
cd clt-bdd-ui
execute the below npm command
npm install --chromedriver_skip_download=true
execute the below command
node index.js -s ./step-definitions
node ./node_modules/selenium-cucumber-js/index.js -s ./step-definitions
