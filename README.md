### Rails Market
> Status: Incomplete ⚠️

<table>
  <tr>
    <td>Ruby version</td>
    <td>
      2.7.0
    </td>
  </tr>
  <tr>
    <td>Rails version</td>
    <td>
       6.1.6.1
    </td>
  </tr>
  <tr>
    <td>Database</td>
    <td>
      PostgreSQL
    </td>
  </tr>
</table>

## Functionalities:
+ User sign up and login
+ Profile edit
+ Item CRUD
+ Questions CRUD
+ Only admin can access category management

## Instalation instructions:
```
#Clone the repository.
git clone https://github.com/mateusflorez/Rails-market.git

#Open the terminal on the project root file.
cd  Rails-market

#Install Ruby on Rails dependencies
bundle install

#Install Node dependencies
yarn install

#Create the development and test databases
rails db:create

#Create the tables
rails db:migrate

#Run the project
rails s
```
Open the browser at the address `localhost:3000`.
