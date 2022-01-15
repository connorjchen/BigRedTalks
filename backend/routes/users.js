const Joi = require('joi');
const express = require('express');
const router = express.Router();
const User = require('../models/User');



router.get('/:email', async (req, res) => {
    // Check that the email is a vaild cornell email
    const schema = Joi.string().pattern(/^[a-z]*[0-9]*@cornell.edu$/).messages({
        '*': 'email must be a valid cornell.edu email address'
    });
    const { error, _ } = schema.validate(req.params.email);
    if (error) return res.status(400).send(error);

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
    const schema = Joi.object({
        username: Joi.string().required().min(3).max(20).pattern(new RegExp('^[A-Za-z0-9:;()&@#%+-=~_.,!\"\'/$]*$')),
        color: Joi.string().required().length(7).pattern(new RegExp('^#[A-Fa-f0-9]*$'))
    });
    const { error, _ } = schema.validate(req.body);
    if (error) return res.status(400).send(error);

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