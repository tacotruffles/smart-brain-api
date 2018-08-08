# SmartBrain-api - v2
Basic multi-face image recognition API

1. Clone this repo
2. Run `yarn`
3. Run `yarn start`
4. You must add your own API key in the `controllers/image.js` file to connect to Clarifai API.

You can grab Clarifai API key [here](https://www.clarifai.com/)

** Make sure you use postgreSQL instead of mySQL for this code base.

```
cp .env.temp .env
```
.env file
```
POSTGRES_HOST=
POSTGRES_DB=
POSTGRES_USER=
POSTGRESS_PASSWORD=
CLARIFAI_API_KEY=
```

```
createdb smart-brain
```

Create users table
```
CREATE TABLE users (
    id serial PRIMARY KEY,
    name VARCHAR(100),
    email text UNIQUE NOT NULL,
    entries BIGINT DEFAULT 0,
    joined TIMESTAMP NOT NULL
); 
```

Create login table 
```
CREATE TABLE login (
    id serial PRIMARY KEY,
    hash VARCHAR(100) NOT NULL,
    email text UNIQUE NOT NULL
); 
```