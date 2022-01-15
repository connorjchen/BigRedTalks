const Joi = require('joi');
const express = require('express');
const router = express.Router();
const Message = require('../models/Message');



router.post('/add', async (req, res) => {
    const schema = Joi.object({
        senderEmail: Joi.string().pattern(/^[a-z]*[0-9]*@cornell.edu$/).messages({
            '*': 'email must be a valid cornell.edu email address'
        }),
        username: Joi.string().required().min(3).max(20).pattern(new RegExp('^[A-Za-z0-9:;()&@#%+-=~_.,!\"\'/$]*$')),
        text: Joi.string().required()
    });
    const { error, _ } = schema.validate(req.body);
    if (error) return res.status(400).send(error);

    try {
        const initMsg = new Message(req.body);
        const newMsg = await initMsg.save();
        return res.json(newMsg);
    } catch (err) {
        res.json({ message: err });
    };
});

router.patch('/:id', async (req, res) => {
    const schema = Joi.object({
        likes: Joi.array().items(
            Joi.string().pattern(/^[a-z]*[0-9]*@cornell.edu$/)
        )
    });
    const { error, _ } = schema.validate(req.body);
    if (error) return res.status(400).send(error);

    try {
        const updatedMsg = await Message.findByIdAndUpdate(
            req.params.id,
            req.body,
            { new: true }
        );
        res.json(updatedMsg);
    } catch(err) {
        res.json({ message: err });
    };
});

router.get('/:index', async (req, res) => {
    // default amount of posts retrieved is 100
    const limit = req.query.limit || 100;

    try {
        const found = await Message.find()
            .sort({'timestamp': -1})
            .skip(req.params.index * limit)
            .limit(limit);
        return res.json(found);
    } catch(err) {
        res.json({ message: err });
    };
});



module.exports = router;