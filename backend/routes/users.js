const express = require('express');
const router = express.Router();
const User = require('../models/User');



router.get('/:email', async (req, res) => {
    try {
        const user = await User.findById(req.params.email);

        // If getting an existing user, return the user
        if (user) {
            return res.json({
                user: user,
                isNew: false
            });
        }

        // If getting a new user, add them to the database with default settings
        const initUser = new User({
            _id: req.params.email,
            username: req.params.email.split('@')[0]
        });
        // Save the new user to the database
        try {
            const newUser = await initUser.save();
            return res.json({
                user: newUser,
                isNew: true
            });
        } catch(err) {
            res.json({ message: err });
        };
    } catch(err) {
        res.json({ message: err });
    };
});

router.patch('/:email', async (req, res) => {
    try{
        const updatedUser = await User.findByIdAndUpdate(
            req.params.email,
            req.body,
            { new: true }
        );
        res.json(updatedUser);
    } catch(err) {
        res.json({ message: err });
    };
});



module.exports = router;