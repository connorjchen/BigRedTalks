const mongoose = require('mongoose');

const UserSchema = mongoose.Schema({
    email: {
        type: String,
        required: true
    },
    username: {
        type: String,
        required: true,
    },
    color: {
        type: String,
        default: "#22D7FF"
    },
    banned: {
        type: Boolean,
        default: false
    }
});