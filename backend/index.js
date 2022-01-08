const express = require('express');
const mongoose = require('mongoose');
require('dotenv/config');


const app = express();

app.use(express.json());


const usersRoute = require('./routes/users');
const msgsRoute = require('./routes/messages');

app.use('/users', usersRoute);
app.use('/messages', msgsRoute);


// app.get('/', (req, res) => {
//     res.send('Hello World');
// });


mongoose.connect(
    process.env.DB_CONNECTION,
    () => console.log('Connected to DB')
);


const port = process.env.PORT || 3000;
app.listen(port, () => console.log(`Listening on port ${port}...`));