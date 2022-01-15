# ₱TAKA Stock App

![image](https://user-images.githubusercontent.com/86831395/149603265-74a749ed-bd27-4a37-8345-9891d32e765e.png)

This project is a forked project from the main repo https://github.com/avionschool/rails-base-project. ₱TAKA's primary function is to buy and sell stocks from the stock market.

#### Version

```
  rails 6.0.4.4
  ruby 3.0.2
  yarn 1.22.4
  nodejs 12.18.3
```

#### Installation

Fork the main repo:
![image](https://user-images.githubusercontent.com/9253881/111437757-6c527f00-873e-11eb-8d0a-862e4158f4ab.png)

https://github.com/avionschool/rails-base-project

Then, clone your forked repo to your machine
```
  $ git clone git@github.com:<username>/rails-base-project.git <name of your app>
  $ cd <name of your app>
```

#### Setup

```
  $ bundle install
  $ rake db:setup
```

#### Starting the application

```
  $ rails server
```

#### See it live

https://pitaka-stock-app.herokuapp.com/users/sign_in

```
Admin Credentials: 
Email: admin@example.com
password: password [only 1 admin]
```

#### API
1. Currency Exchange Rate
   - https://pitaka-stock-app.herokuapp.com/api/exchange_rate?currency=USD
2. Random Activity Suggestion
   - https://pitaka-stock-app.herokuapp.com/api/activity_suggestion
3. Random Cat fact 
   - https://pitaka-stock-app.herokuapp.com/api/cat_fact
4. Random Emoji positive face
   - https://pitaka-stock-app.herokuapp.com/api/random_positive_emoji
5. Random quote
   - http://pitaka-stock-app.herokuapp.com/api/random_quote

### Collaborators
1. Kimcarl Cacas
    - https://github.com/kbcacas  
1. Richelle Lobo
    - https://github.com/LoboRich
