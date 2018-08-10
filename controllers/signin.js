const jwt = require('jsonwebtoken');
const redis = require('redis');

// Setup Redis:
const redisClient = redis.createClient(process.env.REDIS_URI);

const handleSignin = (db, bcrypt, req, res) => {
   const { email, password } = req.body;
   if (!email || !password) {
      return Promise.reject('incorrect form submission');
   }

   return db.select('email', 'hash').from('login')
      .where('email', '=', email)
      .then(data => {
         const isValid = bcrypt.compareSync(password, data[0].hash);
         if (isValid) {
            return db.select('*').from('users')
               .where('email', '=', email)
               .then(user => user[0])
               .catch(err => Promise.reject('unable to get user'))
         } else {
            Promise.reject('wrong credentials')
         }
      })
      .catch(err => Promise.reject('wrong credentials'))
}

const getAuthTokenId = () => {
   console.log('auth ok');
}

const signToken = (email) => {
   const jwtPayload = { email };
   return jwt.sign(jwtPayload, process.env.JWT_SECRET, { expiresIn: '2 days' }); //TODO: move to JWT_SECRET
}

const createSession = (user) => {
   // JWT Token, return user data
   const { email, id } = user;
   const token = signToken(email);
   return { success: 'true', userId: id, token: token }
}

const handleAuthentication = (db, bcrypt) => (req, res) => {
   const { authorization } = req.headers;

   // Is there a token already? If so get the user profile, else handlesign with email/pass
   return authorization ?
      getAuthTokenId() :
      handleSignin(db, bcrypt, req, res)
         .then(data => {
            return data.id && data.email ? createSession(data) : Promise.reject(data);
         })
         .then(session => res.json(session))
         .catch(err => res.status(400).json(err));
}

module.exports = {
   handleAuthentication: handleAuthentication
}