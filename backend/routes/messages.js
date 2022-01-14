const express = require('express');
const router = express.Router();
const Message = require('../models/Message');



router.post('/add', async (req, res) => {
    try {
        const initMsg = new Message(req.body);
        const newMsg = await initMsg.save();
        return res.json(newMsg);
    } catch (err) {
        res.json({ message: err });
    };
});

router.patch('/:id', async (req, res) => {
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