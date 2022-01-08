const mongoose = require('mongoose');

const MessageSchema = mongoose.Schema({
    senderEmail: {
        type: String,
        required: true
    },
    username: {
        type: String,
        required: true
    },
    text: {
        type: String,
        required: true
    },
    timestamp: {
        type: Date,
        default: Date.now
    },
    numberLikes: {
        type: Number,
        default: 0
    }
});